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
       private WatchAnyWhereUC Uc = new WatchAnyWhereUC();
        PriceUC hUc = new PriceUC();
        public MainWindow()
        {
            InitializeComponent();
            Uc.Width = 0;
            gridDisplay.Children.Add(Uc);
            hUc.Width = 0;
            gridDisplay.Children.Add(hUc);

        }

        

        private void btnTag1_Click(object sender, RoutedEventArgs e)
        {
           hUc.Width = 0;
            Uc.Width = 1300;
        }

        private void btnPrice_Click(object sender, RoutedEventArgs e)
        {
            Uc.Width = 0;
            hUc.Width = 1300;

        }

        private void btnRegister_Click(object sender, RoutedEventArgs e)
        {
            gridMain.Children.Clear();
            var wd = new RegisterWizard();
            wd.ShowDialog();
        }
    }
}
