﻿using DA_LTUDQL2.View;
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
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnTag1_Click(object sender, RoutedEventArgs e)
        {
            gridDisplay.Children.Clear();
            var Uc = new WatchAnyWhereUC();
            gridDisplay.Children.Add(Uc);
        }

        private void btnPrice_Click(object sender, RoutedEventArgs e)
        {
            gridDisplay.Children.Clear();
            var Uc = new PriceUC();
            gridDisplay.Children.Add(Uc);
        }

        private void btnRegister_Click(object sender, RoutedEventArgs e)
        {
            gridMain.Children.Clear();
            var wd = new RegisterWizard();
            wd.ShowDialog();
        }
    }
}
