#!/usr/bin/env bash
# Run this from ~/Documents/obsidian on main branch
set -euo pipefail

echo "==> Creating branch..."
git checkout -b claude/organize-obsidian-notes-cgHm6

echo "==> Creating directory structure..."
mkdir -p 01-Inbox
mkdir -p 02-Knowledge/Clippings
mkdir -p 02-Knowledge/School/UXUI
mkdir -p 03-Projects
mkdir -p 04-Goals
mkdir -p 05-Areas/Health
mkdir -p 06-Resources
mkdir -p 07-Templates
mkdir -p 08-Archives
mkdir -p Attachments

echo "==> Moving Clippings..."
git mv "Clippings/(1) daily.dev  Where developers grow together.md" "02-Knowledge/Clippings/(1) daily.dev  Where developers grow together.md"
git mv "Clippings/Cal.com  Open Scheduling Infrastructure.md" "02-Knowledge/Clippings/Cal.com  Open Scheduling Infrastructure.md"
git mv "Clippings/How Much Money Our Free Games Made in 2025.md" "02-Knowledge/Clippings/How Much Money Our Free Games Made in 2025.md"
git mv "Clippings/Installing Archlinux with LUKS, SecureBoot, TPM.md" "02-Knowledge/Clippings/Installing Archlinux with LUKS, SecureBoot, TPM.md"
git mv "Clippings/Reduced instruction set computer - Wikipedia.md" "02-Knowledge/Clippings/Reduced instruction set computer - Wikipedia.md"

echo "==> Moving School..."
git mv "School/DOR-DOD.md" "02-Knowledge/School/DOR-DOD.md"
git mv "School/UXUI/Evaluation UX.md" "02-Knowledge/School/UXUI/Evaluation-UX.md"
git mv "School/UXUI/Pasted image 20260112105517.png" "02-Knowledge/School/UXUI/Pasted image 20260112105517.png"
git mv "School/UXUI/Pasted image 20260112160828.png" "02-Knowledge/School/UXUI/Pasted image 20260112160828.png"
git mv "School/UXUI/Pasted image 20260112161224.png" "02-Knowledge/School/UXUI/Pasted image 20260112161224.png"
git mv "School/UXUI/Pasted image 20260112161949.png" "02-Knowledge/School/UXUI/Pasted image 20260112161949.png"
git mv "School/UXUI/Pasted image 20260112162545.png" "02-Knowledge/School/UXUI/Pasted image 20260112162545.png"
git mv "School/UXUI/Pasted image 20260112163519.png" "02-Knowledge/School/UXUI/Pasted image 20260112163519.png"
git mv "School/UXUI/Pasted image 20260112165429.png" "02-Knowledge/School/UXUI/Pasted image 20260112165429.png"
git mv "School/UXUI/Pasted image 20260120123556.png" "02-Knowledge/School/UXUI/Pasted image 20260120123556.png"
git mv "School/UXUI/Pasted image 20260120124236.png" "02-Knowledge/School/UXUI/Pasted image 20260120124236.png"
git mv "School/UXUI/Pasted image 20260120124444.png" "02-Knowledge/School/UXUI/Pasted image 20260120124444.png"
git mv "School/UXUI/UX-UI.md" "02-Knowledge/School/UXUI/UX-UI.md"

echo "==> Moving images to Attachments..."
git mv "Pasted image 20251207172725.png" "Attachments/Pasted image 20251207172725.png"
git mv "Pasted image 20251218120910.png" "Attachments/Pasted image 20251218120910.png"
git mv "Pasted image 20251219145737.png" "Attachments/Pasted image 20251219145737.png"
git mv "Pasted image 20260121145936.png" "Attachments/Pasted image 20260121145936.png"

echo "==> Removing old files..."
git rm "Notes.md"
git rm "Project Roadmap.md"
git rm "Quarterly quests.md"
git rm "Triathlon Notes.md"

echo "==> Creating new files..."

cat > "01-Inbox/Inbox.md" << 'ENDOFFILE'
# Inbox

Quick captures go here. Review and organize daily.

## Today's Notes

-

## Quick Capture

### Misc Notes

- Urge surfing: A mindfulness technique that helps individuals manage cravings by observing and accepting their urges without acting on them. It involves recognizing urges as temporary sensations that rise and fall, allowing a person to gain control and reduce impulsive behaviors.
- I should learn to write papers, I can start with the documentation for my projects
- I need to learn envs preprod
- Should ask Oussama for a VPS that I could use for tests

### Windows Power Commands


