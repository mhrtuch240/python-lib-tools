README.md ফাইল তৈরি করি যাতে ইউজাররা সহজে টুলটি ইনস্টল এবং ব্যবহার করতে পারে:

```bash
# README.md ফাইল তৈরি
cat > ~/python-lib-tools/README.md << 'EOF'
# Python Library Installation Tool

A comprehensive tool for easily installing Python libraries in Termux, organized by categories.

**Created by:** Mahedi Hasan Rafsun  
**GitHub:** [@mhrtuch240](https://github.com/mhrtuch240)  
**Email:** developer.mahedihasanrafsun@gmail.com  
**Phone:** +8801306654467  
**Last Updated:** 2025-06-27 17:43:58

## Features
- 20 organized categories of Python libraries
- 15 carefully selected libraries in each category
- Easy-to-use menu interface
- Color-coded interface for better visibility
- One-click installation of libraries
- Error handling and feedback
- Simple navigation system

## Categories Available
1. AI and Machine Learning
2. Web Frameworks & Tools
3. Data Science & Analytics
4. Database & ORM
5. Networking & Protocols
6. Security & Cryptography
7. GUI Development
8. Game Development
9. Image & Computer Vision
10. Audio Processing
11. Scientific Computing
12. Testing & Debug
13. Automation & Scripting
14. Code Analysis
15. API Tools
16. File Processing
17. Natural Language
18. Cloud & DevOps
19. System Administration
20. Data Validation

## Installation

### Method 1: Quick Install
```bash
# Update Termux packages
pkg update && pkg upgrade

# Install required packages
pkg install -y python python-pip vim git

# Clone the repository
git clone https://github.com/mhrtuch240/python-lib-tools.git

# Go to directory
cd python-lib-tools

# Run setup script
chmod +x setup.sh
./setup.sh

# Restart Termux
exit
```

### Method 2: Manual Installation
```bash
# Create directory
mkdir -p ~/python-lib-tools

# Copy the script files
cd ~/python-lib-tools
# Copy piptools.sh and setup.sh files here

# Make files executable
chmod +x setup.sh piptools.sh

# Add to PATH
echo "alias piptools='bash ~/python-lib-tools/piptools.sh'" >> ~/.bashrc

# Reload bashrc
source ~/.bashrc
```

## Usage
1. Open Termux
2. Type `piptools` and press Enter
3. Select a category (1-20)
4. Choose a library to install (1-15)
5. Wait for installation to complete

## Categories and Libraries

### 1. AI and Machine Learning
- TensorFlow
- PyTorch
- Scikit-learn
- Keras
- And more...

### 2. Web Development
- Django
- Flask
- FastAPI
- Tornado
- And more...

[View all categories and libraries in the tool]

## Troubleshooting

### If piptools command not found:
```bash
source ~/.bashrc
```
or
```bash
bash ~/python-lib-tools/piptools.sh
```

### If permission denied:
```bash
chmod +x ~/python-lib-tools/piptools.sh
```

### If setup fails:
```bash
# Reinstall the tool
rm -rf ~/python-lib-tools
# Then follow installation steps again
```

## Updates
To update the tool:
```bash
cd ~/python-lib-tools
git pull
./setup.sh
```

## Contribution
Feel free to contribute to this project by:
- Suggesting new libraries
- Reporting bugs
- Adding new features
- Improving documentation

## License
This project is licensed under the MIT License - see the LICENSE file for details

## Contact
For any queries or suggestions:
- GitHub: [@mhrtuch240](https://github.com/mhrtuch240)
- Email: developer.mahedihasanrafsun@gmail.com
- Phone: +8801306654467

## Changelog
- 2025-06-27: Initial release
- Added 20 categories
- Added 300 libraries
- Implemented color interface
- Added error handling

## Support
If you find this tool helpful, please star the repository and share it with others!
EOF
```
