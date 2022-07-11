from mininet.topo import Topo

class MyTopo(Topo):
    def __init__(self):
        #initialize topology
        Topo.__init__(self);

        #Add hosts and switches
        host1 = self.addHost('h1', protocols = 'OpenFlow13');
        host2 = self.addHost('h2', protocols = 'OpenFlow13');
        host3 = self.addHost('h3', protocols = 'OpenFlow13');
        host4 = self.addHost('h4', protocols = 'OpenFlow13');
        host5 = self.addHost('h5', protocols = 'OpenFlow13');
        host6 = self.addHost('h6', protocols = 'OpenFlow13');
        host7 = self.addHost('h7', protocols = 'OpenFlow13');
        host8 = self.addHost('h8', protocols = 'OpenFlow13');
        host9 = self.addHost('h9', protocols = 'OpenFlow13');
        host10 = self.addHost('h10', protocols = 'OpenFlow13');
        host11 = self.addHost('h11', protocols = 'OpenFlow13');
        host12 = self.addHost('h12', protocols = 'OpenFlow13');
        
        switch1 = self.addSwitch('s1', protocols = 'OpenFlow13');
        switch2 = self.addSwitch('s2', protocols = 'OpenFlow13');
        switch3 = self.addSwitch('s3', protocols = 'OpenFlow13');
        switch4 = self.addSwitch('s4', protocols = 'OpenFlow13');
        switch5 = self.addSwitch('s5', protocols = 'OpenFlow13');
        switch6 = self.addSwitch('s6', protocols = 'OpenFlow13');
        switch7 = self.addSwitch('s7', protocols = 'OpenFlow13');
        switch8 = self.addSwitch('s8', protocols = 'OpenFlow13');
        switch9 = self.addSwitch('s9', protocols = 'OpenFlow13');
        switch10 = self.addSwitch('s10', protocols = 'OpenFlow13');
        switch11 = self.addSwitch('s11', protocols = 'OpenFlow13');
        switch12 = self.addSwitch('s12', protocols = 'OpenFlow13');
        
        
        #Add links
        self.addLink(switch1, switch2);
        self.addLink(switch1, switch3);
        self.addLink(switch1, switch4);
        self.addLink(switch2, switch4);
        self.addLink(switch2, switch5);
        self.addLink(switch2, switch7);
        self.addLink(switch3, switch4);
        self.addLink(switch3, switch6);
        self.addLink(switch4, switch5);
        self.addLink(switch4, switch6);
        self.addLink(switch4, switch7);
        self.addLink(switch6, switch7);
        self.addLink(switch6, switch9);
        self.addLink(switch7, switch5);
        self.addLink(switch7, switch8);
        self.addLink(switch7, switch9);
        self.addLink(switch7, switch10);
        self.addLink(switch8, switch5);
        self.addLink(switch9, switch10);
        self.addLink(switch10, switch8);
        self.addLink(switch11, switch2);
        self.addLink(switch11, switch3);
        self.addLink(switch11, switch5);
        self.addLink(switch12, switch1);
        self.addLink(switch12, switch2);
        self.addLink(switch12, switch4);
        self.addLink(switch12, switch8);
        
        
        
        self.addLink(host1, switch1);
        self.addLink(host2, switch2);
        self.addLink(host3, switch2);
        self.addLink(host4, switch9);
        self.addLink(host5, switch9);
        self.addLink(host6, switch10);
        self.addLink(host7, switch5);
        self.addLink(host8, switch8);
        self.addLink(host9, switch3);
        self.addLink(host10, switch6);
        self.addLink(host11, switch5);
        self.addLink(host12, switch5);
        
    
topos = {'mytopo': (lambda: MyTopo())}