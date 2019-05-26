using DA_LTUDQL2.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Input;

namespace DA_LTUDQL2.ViewModel
{
    public class RegisterViewModel:BaseViewModel
    {
        private string _DisplayName;
        private string _Email;
        private string _Password;
        private Model.UserRole _SelectedRole;

        public string DisplayName
        {
            get
            {
                return _DisplayName;
            }

            set
            {
                _DisplayName = value;
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

        public ICommand AddCommand { get; set; }
        public ICommand PasswordChangedCommand { get; set; }

        public UserRole SelectedRole
        {
            get
            {
                return _SelectedRole;
            }

            set
            {
                _SelectedRole = value;
                OnPropertyChanged();
            }
        }




        public RegisterViewModel()
        {
            PasswordChangedCommand = new RelayCommand<PasswordBox>((p) => { return true; }, (p) => { Password = p.Password; });

            AddCommand = new RelayCommand<object>((p) =>
            {
                return true;// điều kiện để nhấn button
            }, (p) =>
            {
                string passEncode = MD5Hash(Base64Encode(Password));

                var Userr = new Model.Userr() { DisplayName = DisplayName, Email = Email, Password = passEncode, IdRole = 3 };
                DataProvider.Ins.DB.Userrs.Add(Userr);
                DataProvider.Ins.DB.SaveChanges();


            });


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
