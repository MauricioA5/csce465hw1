# CSCE 465 HW 1 User Setup

## Environment Summary
### Home Operating System: Windows

### Hypervisor Used: VMWare Workstation Pro
- 8 GB RAM
- 4vCPUs
- Ubuntu 24.04 LTS x86-64

### NAT only networking

## Base Setup
### OS Setup
    sudo apt update 
    sudo apt full-upgrade -y 
    sudo apt install -y curl git 
    sudo reboot
### Node.js and Openclaw installation
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash 
    source "$HOME/.nvm/nvm.sh" 
    nvm install 24.18.0 nvm alias default 24.18.0 
    node --version 
    npm --version
    npm install -g openclaw@2026.7.1-2 
    openclaw --version
## Model Setup: API Model
### On a separate terminal
    export TAMU_API_KEY="<your key>" 
    node tamu-shim.mjs
### Onboard Openclaw
    openclaw onboard --non-interactive --accept-risk \--auth-choice custom-api-key --custom-provider-id tamus \--custom-compatibility openai \--custom-base-url "http://127.0.0.1:8899/openai" \--custom-api-key via-shim \--custom-model-id "protected.gpt-4o" --skip-channelsopenclaw config set models.providers.tamus.request.allowPrivateNetwork trueopenclaw config set agents.defaults.timeoutSeconds 600openclaw config set agents.defaults.memorySearch.enabled falseopenclaw config validateopenclaw models set tamus/protected.gpt-4oopenclaw daemon install && openclaw daemon start
### Setup Diagnostic
    openclaw gateway status # Runtime: running 
    openclaw doctor # no blocking errors 
    openclaw exec-policy show
## Using the Openclaw model
### For a prompt on the terminal
    openclaw agent --agent main -m "Your message here"
### Json
    openclaw agent --agent main -m "Your message here" --json
### Documenting
    openclaw agent --agent main -m "Message" | tee output.txt
    openclaw agent --agent main -m "Message" | tee output.json
### Audits
    openclaw audit
### Exec Policy
    openclaw exec-policy show
## Harmless local tool and web lab
### Create directories
    mkdir -p ~/csce465-agentsec/hw1/{bin,web,markers,evidence}
### Create the following file with the necessary specifications
    ~/csce465-agentsec/hw1/bin/safe-marker
### Create a local Openclaw workspace skill
    ~/.openclaw/workspace/skills/safe-marker/SKILL.md
### Web Pages
    web/benign.html # Normal Report
    web/adversarial.html # Same Report but with an additional untrusted instruction 
### Serving the Pages locally
    cd ~/csce465-agentsec/hw1 
    python3 -m http.server 8000 --directory web --bind 127.0.0.1
## Known Issues 

Openclaw agent not active after onboarding. Running openclaw doctor up to multiple times can solve the issue

Skill safe-marker not found. The skill could be found within the openclaw skills check output as ready only to still not be identified. Allowing some time to pass or prompting the agent to parse through its working directory has been used as methods to solve this problem





