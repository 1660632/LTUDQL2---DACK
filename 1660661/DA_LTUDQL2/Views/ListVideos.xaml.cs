using DA_LTUDQL2.Models;
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

namespace DA_LTUDQL2.Views
{
    /// <summary>
    /// Interaction logic for ListVideos.xaml
    /// </summary>
    public partial class ListVideos : UserControl
    {
        List<VideoInfo> listvideo;
        string lName = "";
        public ListVideos()
        {
            InitializeComponent();
            listvideo = new List<VideoInfo>();
            lbnamelist.Content = lName;
            DataContext = listvideo; 
        }
        public void SetListvideo(List<VideoInfo> lst)
        {
            listvideo.AddRange(lst);
        }
        public void SetName(string name)
        {
            lName = name;
            lbnamelist.Content = lName;
        }

    }
}
