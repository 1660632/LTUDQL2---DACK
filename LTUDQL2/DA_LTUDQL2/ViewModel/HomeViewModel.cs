using DA_LTUDQL2.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using DA_LTUDQL2.View;
using System.Security.Cryptography;

namespace DA_LTUDQL2.ViewModel
{
    class HomeViewModel : BaseViewModel
    {

        private ObservableCollection<View.ListVideos> _VideoList;
        private ObservableCollection<Model.Userr> _Userr;


        private Model.Userr _SelectedItem;
        private Model.Userr _SelectedDisplayName;
        private string _DisplayName;
        public ObservableCollection<View.ListVideos> VideoList
        {
            get
            {
                return _VideoList;
            }
            set
            {
                _VideoList = value;
                OnPropertyChanged();
            }
        }

        public Userr SelectedDisplayName
        {
            get
            {
                return _SelectedDisplayName;
            }

            set
            {
                _SelectedDisplayName = value;
                OnPropertyChanged();
            }
        }

        public string DisplayName
        {
            get
            {
                return _DisplayName;
            }

            set
            {
                _DisplayName = value;
                OnPropertyChanged();
            }
        }

        public ObservableCollection<Userr> Userr
        {
            get
            {
                return _Userr;
            }

            set
            {
                _Userr = value;
                OnPropertyChanged();
            }
        }

        public Userr SelectedItem
        {
            get
            {
                return _SelectedItem;
            }

            set
            {
                _SelectedItem = value;
                OnPropertyChanged();
            }
        }




        public HomeViewModel()
        {

           

            VideoList = new ObservableCollection<View.ListVideos>();
            var kind = from KindVideo in DataProvider.Ins.DB.KindVideos
                       select KindVideo;
            VideoList.Add(new View.ListVideos(new ObservableCollection<Model.Object>(from Object in DataProvider.Ins.DB.Objects
                                                                                     orderby Object.DateInput descending
                                                                                     select Object), "Video Moi"));

            VideoList.Add(new View.ListVideos(new ObservableCollection<Model.Object>(from Object in DataProvider.Ins.DB.Objects
                                                                                     orderby Object.DateInput descending
                                                                                     select Object), "Video Moi"));
            foreach (var ki in kind)
            {
                VideoList.Add(new View.ListVideos(new ObservableCollection<Model.Object>(from Object in DataProvider.Ins.DB.Objects
                                                                                         where Object.IdKind == ki.Id
                                                                                         select Object), ki.DisplayName));
            }
        }


       

    }
}
