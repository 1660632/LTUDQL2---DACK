using DA_LTUDQL2.Model;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace DA_LTUDQL2.ViewModel
{
    public class LoginViewModel : BaseViewModel
    {
        public bool IsLogin { get; set; }
        public bool IsLoaded = false;

        private Model.Userr _SelectItem;
        private string _Email;
        private string _Password;
        private int _IdRole;


        public ICommand LoginCommand { get; set; }
        public ICommand PasswordChangedCommand { get; set; }



        public string Password
        {
            get
            {
                return _Password;
            }

            set
            {
                _Password = value;
                OnPropertyChanged();
            }
        }

        public string Email
        {
            get
            {
                return _Email;
            }

            set
            {
                _Email = value;
                OnPropertyChanged();

            }
        }

        public int IdRole
        {
            get
            {
                return _IdRole;
            }

            set
            {
                _IdRole = value;
                OnPropertyChanged();
            }
        }

        public Model.Userr SelectItem
        {
            get
            {
                return _SelectItem;
            }

            set
            {
                _SelectItem = value;
                OnPropertyChanged();
            }
        }

        public LoginViewModel()
        {
            IsLogin = false;
            Email = "";
            Password = "";

            

            LoginCommand = new RelayCommand<Window>((p) => { return true; }, (p) => { { Login(p); } });
            PasswordChangedCommand = new RelayCommand<PasswordBox>((p) => { return true; }, (p) => { Password = p.Password; });

            
        }

        void Login(Window p)
        {
            if (p == null)
               return;

            string passEncode = MD5Hash(Base64Encode(Password));
            var accCount = DataProvider.Ins.DB.Userrs.Where(x => x.Email == Email && x.Password == passEncode).Count();
            IQueryable<Userr> idrole = from Userr in DataProvider.Ins.DB.Userrs
                                       where Userr.Email == Email && Userr.Password == passEncode
                                       select Userr;
            Userr role = idrole.SingleOrDefault();

            if (accCount > 0)
            {
                IsLogin = true;
                p.Close();
                if (role.IdRole == 1)
                {
                    var ad = new AdminWindow();
                    ad.Show();
                }
                else if (role.IdRole != 1)
                {
                    var hp = new MainWindow();// sẽ thay đổi thành trang khi khách hàng đã đăng nhập
                    hp.Show();
                }
            }
            else
            {
                IsLogin = false;
                MessageBox.Show("Sai tài khoản hoặc mật khẩu!");
            }

        }


        public static string Base64Encode(string plainText)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
            return System.Convert.ToBase64String(plainTextBytes);
        }

        public static string MD5Hash(string input)
        {
            StringBuilder hash = new StringBuilder();
            MD5CryptoServiceProvider md5provider = new MD5CryptoServiceProvider();
            byte[] bytes = md5provider.ComputeHash(new UTF8Encoding().GetBytes(input));

            for (int i = 0; i < bytes.Length; i++)
            {
                hash.Append(bytes[i].ToString("x2"));
            }
            return hash.ToString();
        }


    }
}
