.PHONY: all certs certbot-plausible

certs: certbot-plausible

certbot-plausible:
	certbot -n certonly \
		--agree-tos \
		--email {{ certbot_email }} \
		--dns-cloudflare \
		--dns-cloudflare-credentials /root/cloudflare.ini \
		{% if with_www == true -%}
		-d www.{{ domain_name }} \
		{%- endif %}
		-d {{ domain_name }}
