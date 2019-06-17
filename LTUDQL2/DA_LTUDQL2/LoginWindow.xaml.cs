﻿using DA_LTUDQL2.Model;
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
    /// Interaction logic for LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public string TenDN;
        public LoginWindow()
        {
            InitializeComponent();

        }

        private void btnFogetPass_Click(object sender, RoutedEventArgs e)
        {
            var fgp = new FogetPassUC();
            gridLogin.Children.Add(fgp);
        }

        private void CloseUC_Loaded(object sender, RoutedEventArgs e)
        {
            //MainWindow main = new MainWindow();
            //main.Show();
        }
    }
}
