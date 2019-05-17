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
    /// Interaction logic for PlayVideo.xaml
    /// </summary>
    public partial class PlayVideo : UserControl
    {
        bool isPlay = false;
        public PlayVideo()
        {
            InitializeComponent();
        }
        public void SetVideo(MediaElement media)
        {
            Media.Source = media.Source;
            sliderTime.Value = 0;           
            Media.Play();
            isPlay = !isPlay;
        }

        private void BtnPlayPause_Click(object sender, RoutedEventArgs e)
        {
            if(isPlay==true)
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
