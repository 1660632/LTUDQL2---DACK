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

namespace DA_LTUDQL2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            List<VideoInfo> lst = new List<VideoInfo>
            {
                new VideoInfo
                {
                },
                new VideoInfo
                {
                },
                new VideoInfo
                {
                },
                new VideoInfo
                {
                },
                new VideoInfo
                {
                },
                new VideoInfo
                {
                },
                new VideoInfo
                {
                },
                new VideoInfo
                {
                },
                new VideoInfo
                {
                },
                new VideoInfo
                {
                },
                new VideoInfo
                {
                },
                new VideoInfo
                {
                },
                new VideoInfo
                {
                },
            };
            l1.SetListvideo(lst);
            l1.SetName("Phim Hành Động");
            l2.SetListvideo(lst);
            l2.SetName("Phim Ma");
            l3.SetListvideo(lst);
            l3.SetName("Phim Hoạt Hình");
            l4.SetListvideo(lst);
            l4.SetName("Phim Viễn Tưởng");
            l5.SetListvideo(lst);
            l5.SetName("Phim Cổ Trang");
            l6.SetListvideo(lst);
            l6.SetName("Phim Tào Lao");
        }
    }
}
