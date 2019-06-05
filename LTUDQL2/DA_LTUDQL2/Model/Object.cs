//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DA_LTUDQL2.Model
{
    using System;
    using System.Collections.Generic;
    using ViewModel;

    public partial class Object:BaseViewModel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Object()
        {
            this.MyPlayLists = new HashSet<MyPlayList>();
        }

        private int _Id;
        private string _DisplayName;
        private string _Link;
        private int _IdKind;
        private int _IdSuplier;
        private Nullable<System.DateTime> _DateInput;
        private string _Describe;
        private string _Status;

        private KindVideo _KindVideo;
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MyPlayList> MyPlayLists { get; set; }
        private Suplier _Suplier;

        public int Id
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

        public int IdKind
        {
            get
            {
                return _IdKind;
            }

            set
            {
                _IdKind = value;
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

        public string Status
        {
            get
            {
                return _Status;
            }

            set
            {
                _Status = value;
                OnPropertyChanged();
            }
        }

        public virtual KindVideo KindVideo
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

        public virtual Suplier Suplier
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
    }
}
