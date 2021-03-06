﻿using DA_LTUDQL2.Models;
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
    /// Interaction logic for ListVideos.xaml
    /// </summary>
    public partial class ListVideos : UserControl
    {
        List<VideoInfo> listvideo;
        string lName = "";
        MainWindow Child;
        public ListVideos()
        {
            InitializeComponent();
            listvideo = new List<VideoInfo>();
            lbnamelist.Content = lName;
            DataContext = listvideo; 
        }
        public ListVideos(MainWindow frm)
        {
            InitializeComponent();
            Child = frm;
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

        int timebegin = 3000;
        bool isEnter = false;
        private void grScroll_MouseEnter(object sender, MouseEventArgs e)
        {
            var gr = sender as Grid;
            var me = gr.FindName("video") as MediaElement;
            me.Visibility = Visibility.Visible;
           


            timebegin = 3000;


            if (isEnter)
            {
                timebegin = 1000;
            }
            me?.Play();
            me.Volume = 0;
            var sxDA = new DoubleAnimation();
            sxDA.To = 1.6;
            sxDA.BeginTime = TimeSpan.FromMilliseconds(500);
            sxDA.Duration = TimeSpan.FromMilliseconds(300);
            Storyboard.SetTarget(sxDA, gr);
            Storyboard.SetTargetProperty(sxDA, new PropertyPath("LayoutTransform.ScaleX"));

            var syDA = new DoubleAnimation();
            syDA.To = 1.6;
            syDA.BeginTime = TimeSpan.FromMilliseconds(500);
            syDA.Duration = TimeSpan.FromMilliseconds(300);
            Storyboard.SetTarget(syDA, gr);
            Storyboard.SetTargetProperty(syDA, new PropertyPath("LayoutTransform.ScaleY"));

            var sb = new Storyboard();
            sb.Children.Add(sxDA);
            sb.Children.Add(syDA);            
            
            sb.Begin();
        }

        private void Scroll_MouseEnter(object sender, MouseEventArgs e)
        {
            isEnter = true;
        }

        private void Scroll_MouseLeave(object sender, MouseEventArgs e)
        {
            isEnter = false;
        }

        private void grScroll_MouseLeave(object sender, MouseEventArgs e)
        {
            var gr = sender as Grid;
            var me = gr.FindName("video") as MediaElement;
            me.Visibility = Visibility.Collapsed;
            me?.Stop();

            var sxDA = new DoubleAnimation();           
            sxDA.Duration = TimeSpan.FromMilliseconds(300);
            Storyboard.SetTarget(sxDA, gr);
            Storyboard.SetTargetProperty(sxDA, new PropertyPath("LayoutTransform.ScaleX"));

            var syDA = new DoubleAnimation();            
            syDA.Duration = TimeSpan.FromMilliseconds(300);
            Storyboard.SetTarget(syDA, gr);
            Storyboard.SetTargetProperty(syDA, new PropertyPath("LayoutTransform.ScaleY"));

            var sb = new Storyboard();
            sb.Children.Add(sxDA);
            sb.Children.Add(syDA);
            sb.Begin();
        }
        MediaElement m = new MediaElement();
        public void grScroll_MouseDown(object sender, MouseEventArgs e)
        {
            var gr = sender as Grid;
            var vi = gr.Tag as VideoInfo;
            Child.SenderVideo(vi);
        }

    }
}
