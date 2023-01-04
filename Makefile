install-mk8s:
	@sudo snap install microk8s --classic --channel=1.26/stable
	@mkdir -p ~/.kube
	@sudo usermod -a -G microk8s $$USER
	@sudo chown -f -R $$USER ~/.kube
	@newgrp microk8s

.ONESHELL:
generate-mk8s-config:
	@if [ -f ~/.kube/config ]; then
		echo "config already exist. You should merge this new conf manually according to the doc :"
		echo "https://microk8s.io/docs/working-with-kubectl"
	else
		echo "file does not exist. Generation"
		microk8s config > ~/.kube/config
	fi
