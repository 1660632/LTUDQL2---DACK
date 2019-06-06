using DA_LTUDQL2.Model;
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
    /// Interaction logic for InfoVideo.xaml
    /// </summary>
    public partial class InfoVideo : UserControl
    {
        Model.Object videoInfo;
        public InfoVideo()
        {
            InitializeComponent();

            videoInfo = new Model.Object();
        }
        Home Child;
        public InfoVideo(Home frm)
        {
            InitializeComponent();
            Child = frm;
            videoInfo = new Model.Object();
        }
        public void SetVideo(Model.Object video)
        {
            videoInfo = video;
            DataContext = videoInfo;
        }
        private void BtnXP_Click(object sender, RoutedEventArgs e)
        {
            Child.SenderIV(videoInfo);
        }
    }
}
