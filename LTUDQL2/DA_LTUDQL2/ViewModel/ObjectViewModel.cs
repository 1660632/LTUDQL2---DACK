using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DA_LTUDQL2.Model;
using System.Windows.Input;

namespace DA_LTUDQL2.ViewModel
{
    public class ObjectViewModel:BaseViewModel
    {
        private ObservableCollection<Model.Object> _List;
        private ObservableCollection<Model.KindVideo> _KindVideo;
        private ObservableCollection<Model.Suplier> _Suplier;

        private Model.Object _SelectedItem;
        private Model.KindVideo _SelectedKindVideo;
        private Model.Suplier _SelectedSuplier;

        private string _Id;
        private string _Link;
        private string _DisplayName;
        private int _IdKindVideo;
        private int _IdSuplier;
        private Nullable<DateTime> _DateInput;
        private string _Describe;

        public ObservableCollection<Model.Object> List
        {
            get
            {
                return _List;
            }

            set
            {
                _List = value;
                OnPropertyChanged();
            }
        }

        public ObservableCollection<KindVideo> KindVideo
        {
            get
            {
                return _KindVideo;
            }

            set
            {
                _KindVideo = value;
                OnPropertyChanged();
            }
        }

        public ObservableCollection<Suplier> Suplier
        {
            get
            {
                return _Suplier;
            }

            set
            {
                _Suplier = value;
                OnPropertyChanged();
            }
        }

        public Model.Object SelectedItem
        {
            get
            {
                return _SelectedItem;
            }

            set
            {
                _SelectedItem = value;
                OnPropertyChanged();
                if (SelectedItem != null)
                {
                    DisplayName = SelectedItem.DisplayName;
                    Link = SelectedItem.Link;
                    SelectedKindVideo = SelectedItem.KindVideo;
                    SelectedSuplier = SelectedItem.Suplier;
                    DateInput = SelectedItem.DateInput;
                    Describe = SelectedItem.Describe;
                }
            }
        }

        public KindVideo SelectedKindVideo
        {
            get
            {
                return _SelectedKindVideo;
            }

            set
            {
                _SelectedKindVideo = value;
                OnPropertyChanged();
            }
        }

        public Suplier SelectedSuplier
        {
            get
            {
                return _SelectedSuplier;
            }

            set
            {
                _SelectedSuplier = value;
                OnPropertyChanged();
            }
        }

        public string Id
        {
            get
            {
                return _Id;
            }

            set
            {
                _Id = value;
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

        public int IdKindVideo
        {
            get
            {
                return _IdKindVideo;
            }

            set
            {
                _IdKindVideo = value;
                OnPropertyChanged();
            }
        }

        public int IdSuplier
        {
            get
            {
                return _IdSuplier;
            }

            set
            {
                _IdSuplier = value;
                OnPropertyChanged();
            }
        }

        public DateTime? DateInput
        {
            get
            {
                return _DateInput;
            }

            set
            {
                _DateInput = value;
                OnPropertyChanged();
            }
        }

        public string Describe
        {
            get
            {
                return _Describe;
            }

            set
            {
                _Describe = value;
                OnPropertyChanged();
            }
        }

        public ICommand AddCommand { get; set; }
        public ICommand EditCommand { get; set; }
        public ICommand DeleteCommand { get; set; }

        public string Link
        {
            get
            {
                return _Link;
            }

            set
            {
                _Link = value;
                OnPropertyChanged();
            }
        }

        public ObjectViewModel()
        {
            List = new ObservableCollection<Model.Object>(DataProvider.Ins.DB.Objects);// hiển thị danh sách
            KindVideo = new ObservableCollection<Model.KindVideo>(DataProvider.Ins.DB.KindVideos);
            Suplier = new ObservableCollection<Model.Suplier>(DataProvider.Ins.DB.Supliers);

            AddCommand = new RelayCommand<object>((p) =>
            {
             
                if (SelectedSuplier != null || SelectedKindVideo != null ||SelectedItem!=null)
                {
                    return true;
                }
                return false;

            }, (p) =>
            {
                var Object = new Model.Object() { DisplayName = DisplayName,Link=Link, IdKind = SelectedKindVideo.Id, IdSuplier = SelectedSuplier.Id, DateInput=DateInput, Describe=Describe};
                DataProvider.Ins.DB.Objects.Add(Object);
                DataProvider.Ins.DB.SaveChanges();

                List.Add(Object);
            });

            EditCommand = new RelayCommand<object>((p) =>
            {
                if (SelectedSuplier == null || SelectedKindVideo == null)
                {
                    return false;
                }
                return true;
            }, (p) =>
            {
                var ob = DataProvider.Ins.DB.Objects.Where(x => x.Id == SelectedItem.Id).SingleOrDefault();//lấy ra id tương ứng
                ob.DisplayName = DisplayName;
                ob.Link = Link;
                ob.IdKind = SelectedItem.Id;
                ob.IdSuplier = SelectedSuplier.Id;
                ob.DateInput = DateInput;
                ob.Describe = Describe;
                DataProvider.Ins.DB.SaveChanges();


                DisplayName = SelectedItem.DisplayName;
                Link = SelectedItem.Link;
                SelectedKindVideo = SelectedItem.KindVideo;
                SelectedSuplier = SelectedItem.Suplier;
                DateInput = SelectedItem.DateInput;
                Describe = SelectedItem.Describe;
            });
        }
    }
}
