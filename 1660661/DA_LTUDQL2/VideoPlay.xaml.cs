using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace DA_LTUDQL2
{
    /// <summary>
    /// Interaction logic for VideoPlay.xaml
    /// </summary>
    public partial class VideoPlay : Window
    {
        public VideoPlay(MediaElement media)
        {
            InitializeComponent();
            Media.Source = media.Source;
            Media.Play();            
        }   

        private void Media_MediaOpened(object sender, RoutedEventArgs e)
        {
            slTime.Maximum = Media.NaturalDuration.TimeSpan.TotalMilliseconds;
        }
        bool isPlay = true;
        private void Media_MediaEnded(object sender, RoutedEventArgs e)
        {
            Media.Stop();           
        }

        private void PlayPause_Click(object sender, RoutedEventArgs e)
        {
            if(isPlay==true)
            {
                Media.Pause();
                isPlay = false;
                return;
                
            }
            Media.Play();
            isPlay = true;
                   
        }
    }
}
