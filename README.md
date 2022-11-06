LARAVEL DEPLOYMENT AND POSTGRESQL SETUP(BASH SCRIPT) USING ANISBLE

This material is intended to demonstrate how to use playbooks to automate server setup and run a bashscript for installing and setting up postgresql.

Server automation now plays an essential role in systems administration, due to the disposable nature of modern application environments. Configuration management tools such as Ansible are typically used to streamline the process of automating server setup by establishing standard procedures for new servers. This has the benefit of reducing human error associated with manual setups.

Ansible offers a simplified architecture that doesn't require special software to be installed on nodes. It also provides a robust set of features and built-in modules which facilitate writing automation scripts. In this deployment project, we'll use a DigitalOcean Droplet running Ubuntu.

An Ansible code consists of two parts. The playbook describes a series of steps we want to run, and the inventory defines the servers where we will run the code.

On the other side, Postgres is a free, open-source relational database. It's fully featured, allowing complex queries, sub-selects, foreign keys, triggers, views, functions, and starting with PostgreSQL 11- stored procedures

The repository, contains two sets of playbooks; one will show you the process of setting up a remote LAMP server (Linux(Ubuntu), (A)Apache2, MySql and PHP) on Ubuntu 22.04 and to deploy a demo Laravel project to this server and the other on setting up and executing a bashscript for installing and setting up Postgresql on this said server.

PREREQUISITES/SETUP
1. One Ansible control node: an Ubuntu 20.04 machine with Ansible installed and configured to connect to  Ansible hosts using SSH keys. And a set of valid SSH keys. 

2. One or more Ansible Hosts: one or more remote Ubuntu 22.04 servers. Each host must have the control nodes public key added to its authorized_keys.

STEPS
The playbook for Laravel Application Deployment consist of some of the following steps:
1. Create one or more instances on Digital Ocean
2. Configure ssh connection for desired user
3. Install and configure git 
4. Install LAMP stack
5. Install PHP dependencies
	PHP Version>= 8.1
	BCMath PHP Extension
	Ctype PHP Extension
	cURL PHP Extension
	DOM PHP Extension
	Fileinfo PHP Extension
	JSON PHP Extension
	Mbstring PHP Extension
	OpenSSL PHP Extension
	PCRE PHP Extension
	PDO PHP Extension
	Tokenizer PHP Extension
	ML PHP Extension
6. Install and configure composer
7. Configure Webserver
8. Clone repository at https://github.com/f1amy/laravel-realworld-example-app to server
9. Configure .env.example file
10. Composer Installation
11. Generate application key
12. Migrate DB schema
13. Start Apache2
14. SSL certbot
14. Launch

The BASH Script for the installation and setup of Postgresql consist of the following steps
1. Install pre-requisite software packages
2. Obtain and add software certificates to apt key management
3. create new configuration file with the official postgresql repository address
4. update system software repository
5. install postgres and its extensions
6. create new database and database user
7. grant all priviledges on database to user
8. edit posgresql.conf and pg_hba.conf file
