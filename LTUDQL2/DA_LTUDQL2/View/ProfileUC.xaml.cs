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

namespace DA_LTUDQL2.View
{
    /// <summary>
    /// Interaction logic for ProfileUC.xaml
    /// </summary>
    public partial class ProfileUC : UserControl
    {
        public ProfileUC(string a, string b, string c, string d)
        {
            InitializeComponent();
            lbID.Content = lbID.Content + a;
            lbEmail.Content = lbEmail.Content + b;
            lbName.Content = lbName.Content + c;
        }
    }
}
