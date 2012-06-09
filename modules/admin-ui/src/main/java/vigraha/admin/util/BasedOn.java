package vigraha.admin.util;

public enum BasedOn {

        SMS {
            public String toString(){
                return "SMS";
            }
        } ,

        LBS {
            public String toString(){
                return "LBS";
            }
        } ,

        VOICECALL {
            public String toString(){
                return "VOICECALL";
            }
        },

        GPRS {
            public String toString(){
                return "GPRS";
            }
        },

        USSD {
            public String toString(){
                return "USSD";
            }
        }
    }



