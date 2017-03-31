﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InfluenceWeb.Models
{
        public class FunctionalDetails
        {
            public FunctionalDetails() { }

            public string ImpactDescription
            {
                get;
                set;
            }

            public string ProductName
            {
                get;
                set;
            }

            public string ModuleName
            {
                get;
                set;
            }

            public string Complexity
            {
                get;
                set;
            }
        }
        public class FunctionalDetailss : List<FunctionalDetails>
        {
            public FunctionalDetailss()
            {
                this.Add(new FunctionalDetails());
            }
        }
    }