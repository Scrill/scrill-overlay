
DESCRIPTION
===========

My Gentoo overlay.

CONFIGURATION
=============

1. Add 'https://github.com/Scrill/scrill-overlay/raw/master/scrill-overlay.xml' to layman.cfg in 'overlays' section.
2. Enable overlay in layman:
	layman -f
	layman -a scrill

CONTENT
=======

# app-admin
	Package:	aws-cfn-tools
	Versions:	1.0.6  
	Description:	The command line tools serve as the client interface to the AWS CloudFormation web service.

	Package:	aws-elb-tools
	Versions:	1.0.11.1  
	Description:	The API tools serve as the client interface to the Elastic Load Balancing web service.

	Package:	aws-iam-tools
	Versions:	1.2.0  
	Description:	The Command Line Interface (CLI) for the AWS Identity and Access Management (IAM) Service.

	Package:	mcollective
	Versions:	1.0.0  1.0.1  
	Description:	Common elements of the Marionette Collective management suite.

# app-laptop
	Package:	lenovo-sl-laptop
	Versions:	9999  
	Description:	Linux kernel support for the Lenovo SL series ThinkPads.

# dev-ruby
	Package:	facter
	Versions:	1.5.8  
	Description:	A cross-platform Ruby library for retrieving facts from operating systems.

	Package:	rack
	Versions:	1.0.1  
	Description:	A modular Ruby webserver interface.

	Package:	stomp
	Versions:	1.1.7  
	Description:	A Stomp client written in Ruby.

# net-misc
	Package:	rabbitmq-server
	Versions:	2.2.0  
	Description:	RabbitMQ is a high-performance AMQP-compliant message broker written in Erlang.

	Package:	rabbitmq-stomp-plugin
	Versions:	2.2.0  
	Description:	RabbitMQ STOMP plugin.

# x11-themes
	Package:	milky
	Versions:	2.0  2.0_alpha2  
	Description:	Icon theme for KDE 4 designed by Banu Önal.

	Package:	qutim-kolobok
	Versions:	0.0.2  
	Description:	Kolobok smile pack for net-im/qutim.
