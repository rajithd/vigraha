package vigraha.rule.util;


public enum ExecutorStatus {
    PENDING {
        public String toString(){
            return "PENDING";
        }
    } ,

    RUNNING {
        public String toString(){
            return "RUNNING";
        }
    } ,

    EXECUTED {
        public String toString(){
            return "EXECUTED";
        }
    },

    FAILED {
        public String toString(){
            return "FAILED";
        }
    }
}
