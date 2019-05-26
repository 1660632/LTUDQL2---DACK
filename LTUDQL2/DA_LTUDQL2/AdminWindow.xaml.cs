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
using System.Windows.Shapes;

namespace DA_LTUDQL2
{
    /// <summary>
    /// Interaction logic for AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        public AdminWindow()
        {
            InitializeComponent();
        }


        private void btnSuplier_Click(object sender, RoutedEventArgs e)
        {
            gridHeChucNang.Children.Clear();
            var Uc = new SuplierUC();
            gridHeChucNang.Children.Add(Uc); ;
        }

        private void btnKindVieo_Click(object sender, RoutedEventArgs e)
        {
            gridHeChucNang.Children.Clear();
            var Uc = new KindVideoUC();
            gridHeChucNang.Children.Add(Uc);
        }

        private void btnInforVideo_Click(object sender, RoutedEventArgs e)
        {
            gridHeChucNang.Children.Clear();
            var Uc = new ObjectUC();
            gridHeChucNang.Children.Add(Uc);
        }

        private void btnUserRole_Click(object sender, RoutedEventArgs e)
        {
            gridHeChucNang.Children.Clear();
            var Uc = new UserRoleUC();
            gridHeChucNang.Children.Add(Uc);
        }

        private void btnUser_Click(object sender, RoutedEventArgs e)
        {
            gridHeChucNang.Children.Clear();
            var Uc = new UserUC();
            gridHeChucNang.Children.Add(Uc);
        }

        private void btnPayHis_Click(object sender, RoutedEventArgs e)
        {
            gridHeChucNang.Children.Clear();
            var Uc = new PayHistoryUC();
            gridHeChucNang.Children.Add(Uc);
        }

        private void btnDangKi_Click(object sender, RoutedEventArgs e)
        {
            var win = new RegisterWizard();
            win.ShowDialog();
        }
    }
}
