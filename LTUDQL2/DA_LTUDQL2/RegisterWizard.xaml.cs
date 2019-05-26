using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace DA_LTUDQL2
{
    /// <summary>
    /// Interaction logic for RegisterWizard.xaml
    /// </summary>
    public partial class RegisterWizard : Window
    {
        public int User { get; set; }
        public int email { get; set; }
        public int MK { get; set; }
        public RegisterWizard()
        {
            InitializeComponent();
        }
        public int KiemTraButton(int a, int b, int c)
        {
            if(a == 0 || b == 0 || c == 0)
            {
                return 0;
            }
            return 1;
        }
        public int KiemTraEmail(string Email)
        {
            string str = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
                  @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
                  @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
            Regex re = new Regex(str);
            if (re.IsMatch(Email))
                return 1;
            else
                return 0;
        }
        public int Email(string a)
        {

            if (a == "" || KiemTraEmail(a) == 0)
                return 1;
            else return 0;
        }
        public int UserName1(string a)
        {
            string[] rex = { "@", "!", "#", "$", "%", "^", "&", "*", "(", ")", "-", "+", "=", "_", "{", "[", "]", "}", ":", ";", "?", ",", ">", ".", "<", "/", "`", "~", " " };
            for (int i = 0; i < rex.Length; i++)
            {
                if (rex[i].Contains(a) == true)
                    return 0;
            }
            return 1;
        }
        public int UserName2(string a)
        {
            if (a == "" || UserName1(a) == 0 || a.Length < 6)
                return 0;
            else return 1;
        }

        private void txtUser_TextChanged(object sender, TextChangedEventArgs e)
        {
            int m = UserName2(txtUser.Text.ToString());
            if (m == 0)
            {
                lbUser.Content = "Tài khoản phải lớn hơn 5 ký tự, đúng định dạng";
                User = 0;
            }
            else
            {
                lbUser.Content = "";
                User = 1;
            }
            if (KiemTraButton(User, email, MK) == 0)
                btnDK.IsEnabled = false;
            else btnDK.IsEnabled = true;         
        }

        private void txtEmail_TextChanged(object sender, TextChangedEventArgs e)
        {
            int m = Email(txtEmail.Text.ToString());
            if (m == 1)
            {
                lbEmail.Content = "Sai định dạng email";
                email = 0;
            }
            else
            {
                lbEmail.Content = "";
                email = 1;
            }
            if (KiemTraButton(User, email, MK) == 0)
                btnDK.IsEnabled = false;
            else btnDK.IsEnabled = true;
        }
        private void FloatingPasswordBox_MouseLeave(object sender, MouseEventArgs e)
        {
            string m = FloatingPasswordBox.Password.ToString();
            if (m.Length < 6)
            {
                lbMK.Content = "Mật khẩu phải lớn hơn 6 ký tự";
                MK = 0;
            }
            else
            {
                lbMK.Content = "";
                MK = 1;
            }
            if (KiemTraButton(User, email, MK) == 0)
                btnDK.IsEnabled = false;
            else btnDK.IsEnabled = true;
        }
    }
}
 