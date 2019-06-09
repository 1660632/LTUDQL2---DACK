﻿using DA_LTUDQL2.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace DA_LTUDQL2.View
{
    /// <summary>
    /// Interaction logic for PlayVideo.xaml
    /// </summary>
    public partial class WatchVideo : UserControl
    {
        private bool mediaPlayerIsPlaying = true;
        private bool userIsDraggingSlider = false;
        Model.Object videoI;

        public WatchVideo()
        {
            InitializeComponent();
            DispatcherTimer timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromSeconds(1);
            timer.Tick += timer_Tick;
            timer.Start();
        }
        private void timer_Tick(object sender, EventArgs e)
        {
            if ((Media.Source != null) && (Media.NaturalDuration.HasTimeSpan) && (!userIsDraggingSlider))
            {
                sliderTime.Minimum = 0;
                sliderTime.Maximum = Media.NaturalDuration.TimeSpan.TotalSeconds;
                lbMaxtime.Content = TimeSpan.FromSeconds(Media.NaturalDuration.TimeSpan.TotalSeconds).ToString(@"hh\:mm\:ss");
                sliderTime.Value = Media.Position.TotalSeconds;
                if (sliderTime.Value >= Media.NaturalDuration.TimeSpan.TotalSeconds - 1)
                {
                    Media.Stop();
                    imgPlayPause.Source = new BitmapImage(new Uri(@"E:\HoangTrung\LTUDQL2\LTUDQL2---DACK\1660661\icon\video-pause-button.png"));
                    mediaPlayerIsPlaying = false;
                }
            }
        }
        public void ClearVideo()
        {
            Media.Source = null;
        }
        public void SetMedia(Model.Object video, TimeSpan time)
        {
            try
            {
                Media.Source = new Uri(video.Link);
                Media.Position = time;
                GMedia.Height = 40;
                Media.Play();
            }
            catch
            {
                //new duong dan ko den được video nào thì xuất hình thông báo lỗi
                Media.Source = new Uri(@"E:\HoangTrung\LTUDQL2\LTUDQL2---DACK\1660661\01.png");
                GMedia.Height = 0;
            }
        }
        public TimeSpan GetTime()
        {
            return Media.Position;
        }
        public void BtnX()
        {
            btnX.Visibility = Visibility.Hidden;
        }
        public void SetVideo(Model.Object video)
        {
            try
            {
                videoI = video;
                Media.Source = new Uri(video.Link);
                sliderTime.Value = 0;
                GMedia.Height = 40;
                Media.Play();
            }
            catch
            {
                //new duong dan ko den được video nào thì xuất hình thông báo lỗi
                Media.Source = new Uri(@"E:\HoangTrung\LTUDQL2\LTUDQL2---DACK\1660661\01.png");
                GMedia.Height = 0;
            }

        }
        private void Play_CanExecute(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = (Media != null) && (Media.Source != null);
        }
        private void Play_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            if (mediaPlayerIsPlaying == true)
            {
                Media.Pause();
                imgPlayPause.Source = new BitmapImage(new Uri(@"E:\HoangTrung\LTUDQL2\LTUDQL2---DACK\1660661\icon\video-pause-button.png"));
            }
            else
            {
                Media.Play();
                imgPlayPause.Source = new BitmapImage(new Uri(@"E:\HoangTrung\LTUDQL2\LTUDQL2---DACK\1660661\icon\video-play-button.png"));
            }
            mediaPlayerIsPlaying = !mediaPlayerIsPlaying;

        }

        private void BtnVolume_Click(object sender, RoutedEventArgs e)
        {
            if (Media.Volume > 0)
            {
                Media.Volume = 0;
                imgVolume.Source = new BitmapImage(new Uri(@"E:\HoangTrung\LTUDQL2\LTUDQL2---DACK\1660661\icon\volume-off-indicator.png"));
            }
            else
            {
                Media.Volume = sliderVolume.Value;
                imgVolume.Source = new BitmapImage(new Uri(@"E:\HoangTrung\LTUDQL2\LTUDQL2---DACK\1660661\icon\volume-up-indicator.png"));
            }

        }

        private void ChangMediaVolume(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            Media.Volume = (double)sliderVolume.Value;
        }

        private void ChangMediaTime(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            lbStatus.Content = TimeSpan.FromSeconds(sliderTime.Value).ToString(@"hh\:mm\:ss");
        }

        private void BtnFocus_Click(object sender, RoutedEventArgs e)
        {
            Media.Pause();
            var frm = new Focus(videoI, Media.Position);
            if (frm.ShowDialog() == true)
            {
                Media.Position = frm.Time;
                Media.Play();
            }
        }
        private void sliProgress_DragStarted(object sender, DragStartedEventArgs e)
        {
            userIsDraggingSlider = true;
        }

        private void sliProgress_DragCompleted(object sender, DragCompletedEventArgs e)
        {
            userIsDraggingSlider = false;
            Media.Position = TimeSpan.FromSeconds(sliderTime.Value);
        }
    }
}
