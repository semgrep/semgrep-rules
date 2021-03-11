package testcode.sqli.turbine;

import org.apache.turbine.om.peer.BasePeer;
import org.apache.turbine.om.security.peer.GroupPeer;

public class TurbineSql {

    public void injection111(BasePeer peer1, String injection) {
        // ruleid: turbine-sqli
        peer1.executeQuery(injection);
        // ruleid: turbine-sqli
        peer1.executeQuery(injection,false,null);
        // ruleid: turbine-sqli
        peer1.executeQuery(injection,0,0,false,null);
        // ruleid: turbine-sqli
        peer1.executeQuery(injection,0,0,"",false);
        // ruleid: turbine-sqli
        peer1.executeQuery(injection,"");
        // ruleid: turbine-sqli
        peer1.executeQuery(injection,"",false);
    }

    public void injection2(GroupPeer peer2, String injection) {
        // ruleid: turbine-sqli
        peer2.executeQuery(injection);
        // ruleid: turbine-sqli
        peer2.executeQuery(injection,false,null);
        // ruleid: turbine-sqli
        peer2.executeQuery(injection,0,0,false,null);
        // ruleid: turbine-sqli
        peer2.executeQuery(injection,0,0,"",false);
        // ruleid: turbine-sqli
        peer2.executeQuery(injection,"");
        // ruleid: turbine-sqli
        peer2.executeQuery(injection,"",false);
    }

    public void injection3(String injection) {
        // ruleid: turbine-sqli
        BasePeer.executeQuery(injection);
        // ruleid: turbine-sqli
        BasePeer.executeQuery(injection,false,null);
        // ruleid: turbine-sqli
        BasePeer.executeQuery(injection,0,0,false,null);
        // ruleid: turbine-sqli
        BasePeer.executeQuery(injection,0,0,"",false);
        // ruleid: turbine-sqli
        BasePeer.executeQuery(injection,"");
        // ruleid: turbine-sqli
        BasePeer.executeQuery(injection,"",false);
    }

    public void injection4(String injection) {
        // ruleid: turbine-sqli
        GroupPeer.executeQuery(injection);
        // ruleid: turbine-sqli
        GroupPeer.executeQuery(injection,false,null);
        // ruleid: turbine-sqli
        GroupPeer.executeQuery(injection,0,0,false,null);
        // ruleid: turbine-sqli
        GroupPeer.executeQuery(injection,0,0,"",false);
        // ruleid: turbine-sqli
        GroupPeer.executeQuery(injection,"");
        // ruleid: turbine-sqli
        GroupPeer.executeQuery(injection,"",false);
    }

    public void falsePositive(BasePeer peer0) {
        String constantValue = "SELECT * FROM test";
        // ok: turbine-sqli
        peer0.executeQuery(constantValue);
        // ok: turbine-sqli
        peer0.executeQuery(constantValue,false,null);
        // ok: turbine-sqli
        peer0.executeQuery(constantValue,0,0,false,null);
        // ok: turbine-sqli
        peer0.executeQuery(constantValue,0,0,"",false);
        // ok: turbine-sqli
        peer0.executeQuery(constantValue,"");
        // ok: turbine-sqli
        peer0.executeQuery(constantValue,"",false);
    }
}
