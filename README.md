# Lowzin Linux

A terminal-centric, cybersecurity-focused, highly customizable Linux system.

- LFS-style build for transparency and control  
- Integrates Funtoo userland and Bedrock-style multi-userland support  
- Terminal-first workflow; Hyprland-optional for advanced graphical workspace management  
- Cybersecurity toolkit included by default  
- Extremely customizable

---

## Table of Contents

- [Features](#features)
- [Project Goals](#project-goals)
- [Directory Structure](#directory-structure)
- [Quick Start](#quick-start)
- [Installation](#installation)
- [Customization](#customization)
- [Security](#security)
- [FAQ](#faq)
- [Contributing](#contributing)
- [License](#license)

---

## Features

- **Multi-userland**: Combine tools from Gentoo/Funtoo, Arch, Alpine and more
- **Cybersecurity suite**: Prepares you for pentesting, CTFs, audits, and research
- **Tiling & Dynamic Desktop**: Hyprland integration for graphical workspace power-users
- **Ultra-customizable**: All behaviors and UI are modifiable with plain text configs
- **Minimal first**: Terminal is the primary interface—boot to TTY or shell
- **Sandboxing**: Planned support for firejail/bubblewrap isolation
- **Documentation**: All core features will be fully documented

---

## Project Goals

- Maximum transparency, control, and security.
- Toolbox for hackers, researchers, and power users.
- Full userland flexibility—mix and match distributions, sandboxed!
- Secure by default.
- Highly scriptable and easy to automate/manage.

---

## Directory Structure

```
/etc/lowzin/         # Main config and build scripts
/usr/portage/        # Funtoo/Gentoo portage tree
/bedrock/            # Multi-userland overlay management
/usr/share/hyprland/ # Hyprland configs
/opt/cybertools/     # Core cybersecurity tools
/home/user/.config/  # User customizations (shell, tmux, hyprland, etc)
```

---

## Quick Start

Clone, review code, and bootstrap your minimal initial environment:

```bash
git clone https://github.com/likenslikefeet-eng/Lowzin.git
cd Lowzin
bash ./bootstrap.sh
```

> **Warning:** Do not run bootstrap.sh on your main system. See [docs/INSTALL.md](docs/INSTALL.md) for safe installation steps.

---

## Installation

1. Follow `docs/INSTALL.md` for building the LFS base and integrating overlays.
2. Sample configuration is in `/etc/lowzin/example.conf`.
3. To install security tools:
    ```bash
    bash ./install-cybertools.sh
    ```
4. To enable Hyprland desktop, set `hyprland=yes` in your config and install dependencies.

---

## Customization

- Edit `/etc/lowzin/example.conf` to adjust overlays, enable features, pick your shell, and set startup scripts.
- Every aspect is designed for user override—edit configs, swap scripts, build your workflow.

---

## Security

- Only minimal required services enabled by default.
- Hardened kernel and apparmor/SELinux coming soon.
- Tools included: nmap, wireshark, aircrack-ng, john, hydra, tcpdump, hashcat, openssl, gnupg, lynis.
- Sandboxing with firejail/bubblewrap planned for cross-userland utilities.

---

## FAQ

**Is this production ready?**  
No. Lowzin is in its infancy and should not be used on important systems.

**Who is this for?**  
Security enthusiasts, hackers, pentesters, and those who want full control over their OS stack.

**What if I want a window manager?**  
Set `hyprland=yes` in your config, and follow the instructions for Hyprland integration.

**Can I suggest packages or overlays?**  
Absolutely! Open an issue or pull request.

---

## Contributing

We welcome help:
- See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines
- Report issues, request features, or open PRs
- Share your overlay configs and scripts!

---

## License

[Specify your chosen license here — MIT, GPLv3, etc.]

---
