﻿using DA_LTUDQL2.ViewModel;
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

namespace DA_LTUDQL2.UserControlXAML
{
    /// <summary>
    /// Interaction logic for CloseUC.xaml
    /// </summary>
    public partial class CloseUC : UserControl
    {
        public CloseViewModel ViewModel { get; set; }
        public int MyProperty { get; set; }
        public CloseUC()
        {
            InitializeComponent();
            this.DataContext = ViewModel = new CloseViewModel();// gán từ chính giữa ra bên phải rồi tới bên trái
        }
    }
}
