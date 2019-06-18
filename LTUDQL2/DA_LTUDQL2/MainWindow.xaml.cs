using DA_LTUDQL2.View;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DA_LTUDQL2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    partial class MainWindow
    {
        public int SoLuong;
        private WatchAnyWhereUC Uc = new WatchAnyWhereUC();
        PriceUC hUc = new PriceUC();
        public MainWindow()
        {
            InitializeComponent();
            this.Top = 0;
            this.Left = 0;
            Uc.Width = 0;
            gridDisplay.Children.Add(Uc);
            hUc.Width = 0;
            gridDisplay.Children.Add(hUc);
            btnLg.Content = "Đăng nhập";
        }
        public void Coppy(int a)
        {
            SoLuong = a;
            btnLg.Content = "Đăng xuất";
        }
        public bool IsLogin { get; set; }

        bool ishuc = false, isuc = false;
        private void btnTag1_Click(object sender, RoutedEventArgs e)
        {
            if(!isuc)
            {
                hUc.Width = 0;
                Uc.Width = 1300;
                ishuc = false;
                
            }
            else
            {
                Uc.Width = 0;
            }           
            isuc = !isuc;
        }

        private void btnPrice_Click(object sender, RoutedEventArgs e)
        {
            if (!ishuc)
            {
                Uc.Width = 0;
                hUc.Width = 1300;
                isuc = false;
            }
            else
            {
                hUc.Width = 0;
            }
            ishuc = !ishuc;          
        }

        private void btnLg_Click(object sender, System.EventArgs e)
        {
            if(btnLg.Content == "Đăng nhập")
            {
                LoginWindow loginWindow = new LoginWindow();

                loginWindow.ShowDialog();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Đã đăng xuất khỏi tài khoản");
                btnLg.Content = "Đăng nhập";
            }
            
        }

        

        private void btnRegister_Click(object sender, RoutedEventArgs e)
        {
           
            var wd = new RegisterWizard();
            wd.ShowDialog();
        }
    }
}
