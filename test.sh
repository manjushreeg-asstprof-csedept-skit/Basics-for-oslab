name: Configureh Nginx Web Server
hosts: webservers
become: yes
tasks:
- name: Update apt cache
apt:
update_cache: yes
- name: Install Nginx
apt:
name: nginx
state: present
- name: Copy Nginx configuration file
template:
src: nginx.conf.j2
dest: /etc/nginx/nginx.conf
notify:
- Restart Nginx
handlers:
- name: Restart Nginx
service:
name: nginx
state: restarted
