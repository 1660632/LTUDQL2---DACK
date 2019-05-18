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
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DA_LTUDQL2.Views
{
    /// <summary>
    /// Interaction logic for PlayVideo.xaml
    /// </summary>
    public partial class WatchVideo : UserControl
    {
        bool isPlay = true;
        public WatchVideo()
        {
            InitializeComponent();           
        }
        public void ClearVideo()
        {
            Media.Source = null;
        }
        public void SetVideo(VideoInfo video)
        {
            try
            {
                Media.Source = new Uri(video.Path);
                sliderTime.Value = 0;
                GMedia.Height=40;
                Media.Play();
            }catch
            {
                //new duong dan ko den được video nào thì xuất hình thông báo lỗi
                Media.Source = new Uri(@"E:\HoangTrung\LTUDQL2\LTUDQL2---DACK\1660661\01.png");
                GMedia.Height=0;
            }
           
        }
        private void BtnPlayPause_Click(object sender, RoutedEventArgs e)
        {
            if (isPlay == true)
            {
                Media.Pause();
            }
            else
            {
                Media.Play();
            }
            isPlay = !isPlay;
        }

        private void BtnVolume_Click(object sender, RoutedEventArgs e)
        {
            if (Media.Volume > 0)
            {
                Media.Volume = 0;
            }
            else
            {
                Media.Volume = sliderVolume.Value;
            }

        }

        private void ChangMediaVolume(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            Media.Volume = (double)sliderVolume.Value;
        }

        private void ChangMediaTime(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            sliderTime.Maximum = Media.NaturalDuration.TimeSpan.TotalSeconds;
            int SliderValue = (int)sliderTime.Value;

            TimeSpan ts = new TimeSpan(0, 0, 0, SliderValue);
            Media.Position = ts;
        }
    }
}
