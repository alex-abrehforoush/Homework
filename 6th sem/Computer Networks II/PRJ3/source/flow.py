import http.client as httplib
import json

class StaticEntryPusher(object):

    def __init__(self, server):
        self.server = server;
    
    def get(self, data):
        ret = self.rest_call({}, 'GET');
        return json.loads(ret[2]);
    
    def Set(self, data):
        ret = self.rest_call(data, 'POST');
        return ret[0] == 200;

    def remove(self, objtype, data):
        ret = self.rest_call(data, 'DELETE');
        return ret[0] == 200;
    
    def rest_call(self, data, action):
        path = '/wm/staticentrypusher/json';
        header = {
            'Canten-type': 'application/json',
            'Accept': 'application/json'
        }
        body = json.dumps(data);
        conn = httplib.HTTPConnection(self.server, 8080);
        conn.request(action, path, body, header);
        response = conn.getresponse();
        ret = (response.status, response.reason, response.read());
        print(ret);
        conn.close();
        return ret;
    
def main():
    pusher = StaticEntryPusher('127.0.0.1');
    entry11 = {
        "switch": "00.00.00.00.00.00.00.02",
        "name": "flow1",
        "eth_type": "0x0800",
        "ipv4_src": "10.0.0.2",
        "ipv4_dst": "10.0.0.4",
        "priority": "32768",
        "in_port": "7",
        "active": "true",
        "actions": "output=6"
    }
    entry12 = {
        "switch": "00.00.00.00.00.00.00.0c",
        "name": "flow2",
        "eth_type": "0x0800",
        "ipv4_src": "10.0.0.2",
        "ipv4_dst": "10.0.0.4",
        "priority": "32768",
        "in_port": "2",
        "active": "true",
        "actions": "output=3"
    }
    entry13 = {
        "switch": "00.00.00.00.00.00.00.04",
        "name": "flow3",
        "eth_type": "0x0800",
        "ipv4_src": "10.0.0.2",
        "ipv4_dst": "10.0.0.4",
        "priority": "32768",
        "in_port": "7",
        "active": "true",
        "actions": "output=6"
    }
    entry14 = {
        "switch": "00.00.00.00.00.00.00.07",
        "name": "flow4",
        "eth_type": "0x0800",
        "ipv4_src": "10.0.0.2",
        "ipv4_dst": "10.0.0.4",
        "priority": "32768",
        "in_port": "2",
        "active": "true",
        "actions": "output=6"
    }
    entry15 = {
        "switch": "00.00.00.00.00.00.00.09",
        "name": "flow5",
        "eth_type": "0x0800",
        "ipv4_src": "10.0.0.2",
        "ipv4_dst": "10.0.0.4",
        "priority": "32768",
        "in_port": "2",
        "active": "true",
        "actions": "output=4"
    }
    ##############################################

    pusher.Set(entry11);
    pusher.Set(entry12);
    pusher.Set(entry13);
    pusher.Set(entry14);
    pusher.Set(entry15);

    

main();