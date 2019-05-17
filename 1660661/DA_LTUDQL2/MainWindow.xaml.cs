using DA_LTUDQL2.Models;
using DA_LTUDQL2.Views;
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
        public delegate void SendVideo(MediaElement media);
        public SendVideo SenderVideo;
        private void GetVideo(MediaElement media)
        {
            grPlay.Height = 720;
            Media.Width=1280;
            Media.Height = 720;
            Media.SetVideo(media);
            grPlay.Children.Clear();
            grPlay.Children.Add(Media);
        }
        public MainWindow()
        {
            InitializeComponent();
            SenderVideo = new SendVideo(GetVideo);
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
           
            var l1 = new ListVideos(this);
            l1.SetListvideo(lst);
            l1.SetName("Phim Hành Động");
            Stack.Children.Add(l1);
            var l2 = new ListVideos(this);
            l2.SetListvideo(lst);
            l2.SetName("Phim Ma");
            Stack.Children.Add(l2);
            //l3.SetListvideo(lst);
            //l3.SetName("Phim Hoạt Hình");
            //l4.SetListvideo(lst);
            //l4.SetName("Phim Viễn Tưởng");
            //l5.SetListvideo(lst);
            //l5.SetName("Phim Cổ Trang");
            //l6.SetListvideo(lst);
            //l6.SetName("Phim Tào Lao");
        }
    }
}
