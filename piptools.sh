#!/bin/bash

# Update packages
pkg update && pkg upgrade -y
pkg install -y python python-pip vim git

# Create project directory structure
mkdir -p $HOME/python-lib-tools
cd $HOME/python-lib-tools

# Create main script
cat > piptools.sh << 'EOF'
#!/bin/bash

# Update timestamp: 2025-06-27 17:20:30
# Author: @mhrtuch240

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Tool Information
show_header() {
    clear
    echo -e "${BLUE}================================================${NC}"
    echo -e "${GREEN}        Python Library Installation Tool         ${NC}"
    echo -e "${CYAN}Last Updated: 2025-06-27 17:20:30${NC}"
    echo -e "${CYAN}Made by: Mahedi Hasan Rafsun${NC}"
    echo -e "${CYAN}GitHub: @mhrtuch240${NC}"
    echo -e "${CYAN}Email: developer.mahedihasanrafsun@gmail.com${NC}"
    echo -e "${CYAN}Phone: +8801306654467${NC}"
    echo -e "${BLUE}================================================${NC}"
}

# Function to install selected library
install_library() {
    echo -e "${YELLOW}Installing $1...${NC}"
    pip install $1
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Successfully installed $1${NC}"
    else
        echo -e "${RED}Failed to install $1${NC}"
    fi
    read -p "Press Enter to continue..."
}

# Main menu categories
show_categories() {
    echo -e "\n${BLUE}Select a Category:${NC}"
    
    # AI and Machine Learning
    echo -e "${YELLOW}1) AI and Machine Learning${NC}"
    echo "   Deep learning frameworks and ML tools"
    
    # Web Development
    echo -e "${YELLOW}2) Web Frameworks & Tools${NC}"
    echo "   Web development and API frameworks"
    
    # Data Science
    echo -e "${YELLOW}3) Data Science & Analytics${NC}"
    echo "   Data analysis and visualization"
    
    # Database
    echo -e "${YELLOW}4) Database & ORM${NC}"
    echo "   Database connectors and ORMs"
    
    # Networking
    echo -e "${YELLOW}5) Networking & Protocols${NC}"
    echo "   Network programming tools"
    
    # Security
    echo -e "${YELLOW}6) Security & Cryptography${NC}"
    echo "   Security testing and encryption"
    
    # GUI Development
    echo -e "${YELLOW}7) GUI & Desktop Apps${NC}"
    echo "   Desktop application frameworks"
    
    # Game Development
    echo -e "${YELLOW}8) Game Development${NC}"
    echo "   Game engines and frameworks"
    
    # Image Processing
    echo -e "${YELLOW}9) Image & Computer Vision${NC}"
    echo "   Image processing libraries"
    
    # Audio Processing
    echo -e "${YELLOW}10) Audio Processing${NC}"
    echo "   Audio analysis and synthesis"
    
    # Scientific Computing
    echo -e "${YELLOW}11) Scientific Computing${NC}"
    echo "   Scientific calculations and simulations"
    
    # Testing
    echo -e "${YELLOW}12) Testing & Debug${NC}"
    echo "   Testing frameworks and tools"
    
    # Automation
    echo -e "${YELLOW}13) Automation & Scripting${NC}"
    echo "   Process automation tools"
    
    # Code Analysis
    echo -e "${YELLOW}14) Code Analysis${NC}"
    echo "   Code quality and linting"
    
    # API Development
    echo -e "${YELLOW}15) API Tools${NC}"
    echo "   API development and testing"
    
    # File Processing
    echo -e "${YELLOW}16) File Processing${NC}"
    echo "   File handling and conversion"
    
    # NLP
    echo -e "${YELLOW}17) Natural Language${NC}"
    echo "   Text processing and NLP"
    
    # Cloud Services
    echo -e "${YELLOW}18) Cloud & DevOps${NC}"
    echo "   Cloud service integration"
    
    # System Tools
    echo -e "${YELLOW}19) System Administration${NC}"
    echo "   System management tools"
    
    # Data Validation
    echo -e "${YELLOW}20) Data Validation${NC}"
    echo "   Data cleaning and validation"
    
    echo -e "${RED}0) Exit${NC}"
}

# Category specific library lists
show_category_libraries() {
    local category=$1
    case $category in
        1) # AI and Machine Learning
            echo -e "\n${YELLOW}AI and Machine Learning Libraries:${NC}"
            echo "1) tensorflow        - Deep learning framework"
            echo "2) pytorch          - Machine learning library"
            echo "3) scikit-learn     - ML algorithms"
            echo "4) keras            - Neural network API"
            echo "5) transformers     - NLP models"
            echo "6) opencv-python    - Computer vision"
            echo "7) xgboost         - Gradient boosting"
            echo "8) lightgbm        - Gradient boosting framework"
            echo "9) fastai          - Deep learning library"
            echo "10) catboost       - Gradient boosting library"
            echo "11) paddle         - Deep learning platform"
            echo "12) autokeras      - AutoML library"
            echo "13) detectron2     - Object detection"
            echo "14) pytorch-lightning - PyTorch wrapper"
            echo "15) stable-baselines3 - RL algorithms"
            ;;
            
        2) # Web Frameworks
            echo -e "\n${YELLOW}Web Development Libraries:${NC}"
            echo "1) django          - Web framework"
            echo "2) flask           - Lightweight web framework"
            echo "3) fastapi         - Modern web framework"
            echo "4) tornado         - Async web framework"
            echo "5) dash            - Analytical web apps"
            echo "6) streamlit       - Data apps"
            echo "7) aiohttp         - Async HTTP client/server"
            echo "8) bottle          - Simple web framework"
            echo "9) pyramid         - Web framework"
            echo "10) cherrypy       - Object-oriented framework"
            echo "11) sanic          - Fast HTTP framework"
            echo "12) django-rest-framework - REST API framework"
            echo "13) connexion      - API framework"
            echo "14) graphene       - GraphQL framework"
            echo "15) starlette      - ASGI framework"
            ;;

        3) # Data Science
            echo -e "\n${YELLOW}Data Science Libraries:${NC}"
            echo "1) pandas          - Data manipulation"
            echo "2) numpy           - Numerical computing"
            echo "3) scipy          - Scientific computing"
            echo "4) matplotlib      - Data visualization"
            echo "5) seaborn        - Statistical visualization"
            echo "6) plotly         - Interactive plots"
            echo "7) bokeh          - Interactive visualization"
            echo "8) statsmodels    - Statistical models"
            echo "9) scikit-image   - Image processing"
            echo "10) dask          - Parallel computing"
            echo "11) vaex          - Big data framework"
            echo "12) numba         - JIT compiler"
            echo "13) sympy         - Symbolic mathematics"
            echo "14) networkx      - Network analysis"
            echo "15) pandas-profiling - Data analysis"
            ;;

        4) # Database
            echo -e "\n${YELLOW}Database Libraries:${NC}"
            echo "1) sqlalchemy      - SQL toolkit and ORM"
            echo "2) pymongo        - MongoDB driver"
            echo "3) redis          - Redis client"
            echo "4) psycopg2       - PostgreSQL adapter"
            echo "5) mysql-connector - MySQL connector"
            echo "6) pymysql        - MySQL client"
            echo "7) motor          - Async MongoDB"
            echo "8) peewee         - Small ORM"
            echo "9) cassandra-driver - Cassandra client"
            echo "10) neo4j         - Neo4j driver"
            echo "11) elasticsearch - Elasticsearch client"
            echo "12) pony          - ORM"
            echo "13) tortoise-orm  - Async ORM"
            echo "14) databases     - Async database"
            echo "15) sqlmodel      - SQL database"
            ;;

        5) # Networking
            echo -e "\n${YELLOW}Networking Libraries:${NC}"
            echo "1) requests       - HTTP library"
            echo "2) urllib3        - HTTP client"
            echo "3) paramiko       - SSH protocol"
            echo "4) twisted        - Event-driven networking"
            echo "5) asyncio        - Async I/O"
            echo "6) websockets     - WebSocket client/server"
            echo "7) pyzmq          - ZeroMQ interface"
            echo "8) pycurl         - URL library"
            echo "9) httpx          - HTTP client"
            echo "10) grpcio        - gRPC framework"
            echo "11) netmiko       - Network devices"
            echo "12) scapy         - Packet manipulation"
            echo "13) pyngrok       - ngrok wrapper"
            echo "14) requests-html - HTML parsing"
            echo "15) aiofiles      - Async file operations"
            ;;

        6) # Security
            echo -e "\n${YELLOW}Security Libraries:${NC}"
            echo "1) cryptography   - Cryptography recipes"
            echo "2) pycryptodome   - Cryptographic algorithms"
            echo "3) bcrypt         - Password hashing"
            echo "4) pyopenssl      - OpenSSL wrapper"
            echo "5) passlib        - Password hashing"
            echo "6) jwt            - JSON Web Tokens"
            echo "7) oauthlib       - OAuth implementation"
            echo "8) pyotp          - One-time passwords"
            echo "9) pyjwt          - JSON Web Tokens"
            echo "10) itsdangerous  - Data signing"
            echo "11) scrapy        - Web scraping"
            echo "12) mechanize     - Stateful web browsing"
            echo "13) stem          - Tor controller"
            echo "14) pynacl        - Networking and cryptography"
            echo "15) secure        - Security helpers"
            ;;

        7) # GUI Development
            echo -e "\n${YELLOW}GUI Development Libraries:${NC}"
            echo "1) tkinter        - Standard GUI"
            echo "2) PyQt5          - Qt framework"
            echo "3) PyQt6          - Qt6 framework"
            echo "4) wxPython       - GUI toolkit"
            echo "5) kivy           - NUI framework"
            echo "6) pygame         - Game development"
            echo "7) pyside6        - Qt framework"
            echo "8) pyqtwebengine  - Web renderer"
            echo "9) toga           - Native GUI"
            echo "10) gtk           - GTK interface"
            echo "11) flexx         - Pure Python UI"
            echo "12) dearpygui     - Dear PyGui"
            echo "13) customtkinter - Modern tkinter"
            echo "14) pywebview     - WebView component"
            echo "15) ttkbootstrap  - Themed tkinter"
            ;;

        8) # Game Development
            echo -e "\n${YELLOW}Game Development Libraries:${NC}"
            echo "1) pygame         - Game development"
            echo "2) arcade         - 2D games"
            echo "3) panda3d        - 3D engine"
            echo "4) pyglet         - Game/multimedia"
            echo "5) kivy           - Multi-touch games"
            echo "6) cocos2d        - 2D game engine"
            echo "7) ursina         - Game engine"
            echo "8) pyopengl       - OpenGL wrapper"
            echo "9) pygame-gui     - GUI for pygame"
            echo "10) rabbyt        - Sprite library"
            echo "11) harfang3d     - 3D visualization"
            echo "12) pysdl2        - SDL2 wrapper"
            echo "13) moderngl      - OpenGL wrapper"
            echo "14) pyray         - raylib wrapper"
            echo "15) wasabi2d      - 2D games"
            ;;

        9) # Image Processing
            echo -e "\n${YELLOW}Image Processing Libraries:${NC}"
            echo "1) pillow         - Image processing"
            echo "2) opencv-python  - Computer vision"
            echo "3) scikit-image   - Image processing"
            echo "4) imageio        - Image I/O"
            echo "5) wand           - ImageMagick binding"
            echo "6) mahotas        - Computer vision"
            echo "7) simplecv       - Computer vision"
            echo "8) pyvips         - Image processing"
            echo "9) imutils        - Image utilities"
            echo "10) kornia        - Computer vision"
            echo "11) rawpy         - RAW images"
            echo "12) pixellib      - Image segmentation"
            echo "13) face-recognition - Face detection"
            echo "14) pygraphviz    - Graphviz interface"
            echo "15) svgwrite      - SVG files"
            ;;

        10) # Audio Processing
            echo -e "\n${YELLOW}Audio Processing Libraries:${NC}"
            echo "1) librosa        - Music analysis"
            echo "2) pyaudio        - Audio I/O"
            echo "3) sounddevice    - Audio I/O"
            echo "4) simpleaudio    - Audio playback"
            echo "5) pygame         - Sound support"
            echo "6) pydub          - Audio processing"
            echo "7) python-sox     - Sound processing"
            echo "8) audioread      - Audio file read"
            echo "9) wave           - WAV files"
            echo "10) mutagen       - Audio metadata"
            echo "11) soundfile     - Audio files"
            echo "12) playsound     - Audio playback"
            echo "13) pyrubberband  - Audio stretching"
            echo "14) aubio         - Music analysis"
            echo "15) pydsm         - Digital signal"
            ;;

        11) # Scientific Computing
            echo -e "\n${YELLOW}Scientific Computing Libraries:${NC}"
            echo "1) numpy          - Numerical computing"
            echo "2) scipy          - Scientific library"
            echo "3) sympy          - Symbolic math"
            echo "4) statsmodels    - Statistical modeling"
            echo "5) pandas         - Data analysis"
            echo "6) numba          - JIT compiler"
            echo "7) networkx       - Graph theory"
            echo "8) biopython      - Computational biology"
            echo "9) astropy        - Astronomy"
            echo "10) chempy        - Chemistry"
            echo "11) qiskit        - Quantum computing"
            echo "12) sage          - Mathematics"
            echo "13) uncertainties - Error propagation"
            echo "14) pint          - Physical quantities"
            echo "15) scikit-rf     - RF engineering"
            ;;

        12) # Testing
            echo -e "\n${YELLOW}Testing Libraries:${NC}"
            echo "1) pytest         - Testing framework"
            echo "2) unittest       - Unit testing"
            echo "3) nose          - Test runner"
            echo "4) coverage       - Code coverage"
            echo "5) hypothesis     - Property testing"
            echo "6) behave        - BDD testing"
            echo "7) robotframework - Acceptance testing"
            echo "8) selenium       - Browser automation"
            echo "9) mock          - Mocking library"
            echo "10) tox          - Testing tool"
            echo "11) pytest-cov    - Coverage plugin"
            echo "12) pytest-xdist  - Distributed testing"
            echo "13) locust        - Load testing"
            echo "14) faker         - Fake data"
            echo "15) factory-boy   - Test fixtures"
            ;;

        13) # Automation
            echo -e "\n${YELLOW}Automation Libraries:${NC}"
            echo "1) selenium       - Browser automation"
            echo "2) pyautogui      - GUI automation"
            echo "3) schedule       - Job scheduling"
            echo "4) prefect        - Workflow automation"
            echo "5) luigi          - Pipeline automation"
            echo "6) rpa            - Robotic process"
            echo "7) automate-it    - Task automation"
            echo "8) pywinauto      - Windows automation"
            echo "9) airflow        - Workflow platform"
            echo "10) fabric        - Deployment automation"
            echo "11) invoke        - Task execution"
            echo "12) ansible       - IT automation"
            echo "13) watchdog      - File system events"
            echo "14) supervisor    - Process control"
            echo "15) paramiko      - Remote execution"
            ;;

        14) # Code Analysis
            echo -e "\n${YELLOW}Code Analysis Libraries:${NC}"
            echo "1) pylint         - Code analysis"
            echo "2) flake8         - Style guide"
            echo "3) mypy           - Static typing"
            echo "4) bandit         - Security linter"
            echo "5) prospector     - Analysis tool"
            echo "6) pycodestyle    - Style checker"
            echo "7) pydocstyle     - Docstring checker"
            echo "8) radon          - Code metrics"
            echo "9) vulture        - Dead code finder"
            echo "10) mccabe        - Complexity checker"
            echo "11) pytype        - Type checker"
            echo "12) autopep8      - Code formatter"
            echo "13) black         - Code formatter"
            echo "14) isort         - Import sorter"
            echo "15) rope          - Refactoring"
            ;;

        15) # API Tools
            echo -e "\n${YELLOW}API Development Libraries:${NC}"
            echo "1) fastapi        - API framework"
            echo "2) flask-restful  - REST APIs"
            echo "3) django-rest-framework - REST framework"
            echo "4) graphene       - GraphQL framework"
            echo "5) connexion      - API framework"
            echo "6) falcon         - API framework"
            echo "7) hug            - API development"
            echo "8) marshmallow    - Object serialization"
            echo "9) cornice        - REST framework"
            echo "10) apistar       - API toolkit"
            echo "11) eve           - REST API framework"
            echo "12) flask-apispec - API documentation"
            echo "13) sanic         - Async framework"
            echo "14) responder     - API framework"
            echo "15) webargs       - Parser library"
            ;;

        16) # File Processing
            echo -e "\n${YELLOW}File Processing Libraries:${NC}"
            echo "1) pypdf2         - PDF files"
            echo "2) python-docx    - Word documents"
            echo "3) openpyxl       - Excel files"
            echo "4) xlrd          - Excel files"
            echo "5) pyyaml         - YAML files"
            echo "6) beautifulsoup4 - HTML/XML"
            echo "7) lxml           - XML processing"
            echo "8) chardet        - Character encoding"
            echo "9) python-pptx    - PowerPoint"
            echo "10) pyexcel       - Spreadsheets"
            echo "11) zipfile       - ZIP archives"
            echo "12) tarfile       - TAR archives"
            echo "13) python-magic  - File type detection"
            echo "14) pikepdf       - PDF manipulation"
            echo "15) camelot-py    - PDF tables"
            ;;

        17) # Natural Language
            echo -e "\n${YELLOW}Natural Language Libraries:${NC}"
            echo "1) nltk           - NLP toolkit"
            echo "2) spacy          - NLP library"
            echo "3) gensim         - Topic modeling"
            echo "4) textblob       - Text processing"
            echo "5) transformers   - NLP models"
            echo "6) stanza         - NLP tools"
            echo "7) polyglot       - NLP pipeline"
            echo "8) pattern        - NLP toolkit"
            echo "9) wordcloud      - Word clouds"
            echo "10) flair         - NLP framework"
            echo "11) allennlp      - NLP research"
            echo "12) bert-for-tf2  - BERT models"
            echo "13) torchtext     - Text utilities"
            echo "14) fasttext      - Text classification"
            echo "15) sumy          - Text summarization"
            ;;

        18) # Cloud Services
            echo -e "\n${YELLOW}Cloud Service Libraries:${NC}"
            echo "1) boto3          - AWS SDK"
            echo "2) google-cloud   - Google Cloud"
            echo "3) azure-storage  - Azure Storage"
            echo "4) kubernetes     - Kubernetes API"
            echo "5) docker         - Docker API"
            echo "6) paramiko       - SSH protocol"
            echo "7) apache-libcloud - Cloud providers"
            echo "8) google-auth    - Google Auth"
            echo "9) azure-cosmos   - Azure Cosmos DB"
            echo "10) boto3-stubs   - AWS type hints"
            echo "11) gcloud        - Google Cloud CLI"
            echo "12) azure-mgmt    - Azure Management"
            echo "13) docker-compose - Docker Compose"
            echo "14) pulumi        - Cloud deployment"
            echo "15) terraform     - Infrastructure"
            ;;

        19) # System Administration
            echo -e "\n${YELLOW}System Administration Libraries:${NC}"
            echo "1) psutil         - System monitoring"
            echo "2) fabric         - System admin tasks"
            echo "3) pywinrm        - Windows Remote"
            echo "4) paramiko       - SSH protocol"
            echo "5) sh             - Shell commands"
            echo "6) pyinstaller    - Executables"
            echo "7) click          - CLI creation"
            echo "8) supervisor     - Process control"
            echo "9) watchdog       - File monitoring"
            echo "10) logging       - Logging facility"
            echo "11) distro        - OS information"
            echo "12) psutil        - Process utilities"
            echo "13) pywin32       - Windows API"
            echo "14) cpuinfo       - CPU information"
            echo "15) memory-profiler - Memory usage"
            ;;

        20) # Data Validation
            echo -e "\n${YELLOW}Data Validation Libraries:${NC}"
            echo "1) pydantic       - Data validation"
            echo "2) marshmallow    - Object serialization"
            echo "3) cerberus       - Data validation"
            echo "4) jsonschema     - JSON validation"
            echo "5) voluptuous     - Data validation"
            echo "6) schematics     - Data structures"
            echo "7) valideer       - Data validation"
            echo "8) schema         - Schema validation"
            echo "9) dataclass-json - JSON serialization"
            echo "10) attrs         - Classes without boilerplate"
            echo "11) django-validator - Form validation"
            echo "12) wtforms       - Form validation"
            echo "13) validictory   - JSON validation"
            echo "14) jsonvalidator - JSON validation"
            echo "15) typeguard     - Runtime type checking"
            ;;
            
        *)
            echo -e "${RED}Invalid category${NC}"
            ;;
    esac
}

# Main program loop
while true; do
    show_header
    show_categories
    read -p "Enter category number (0-20): " category

    if [ "$category" = "0" ]; then
        echo -e "${GREEN}Thank you for using Python Library Installation Tool!${NC}"
        exit 0
    fi

    if [ "$category" -ge 1 ] && [ "$category" -le 20 ]; then
        while true; do
            show_header
            show_category_libraries $category
            read -p "Select library to install (0 to go back): " choice
            
            if [ "$choice" = "0" ]; then
                break
            fi
            
            if [ "$choice" -ge 1 ] && [ "$choice" -le 15 ]; then
                # Get library name from the first column of the selected line
                library_name=$(show_category_libraries $category | grep "^$choice)" | cut -d" " -f2)
                if [ ! -z "$library_name" ]; then
                    install_library $library_name
                fi
            else
                echo -e "${RED}Invalid choice${NC}"
                sleep 2
            fi
        done
    else
        echo -e "${RED}Invalid category${NC}"
        sleep 2
    fi
done
EOF

# Make script executable
chmod +x piptools.sh

# Create alias
echo "alias piptools='bash $HOME/python-lib-tools/piptools.sh'" >> $HOME/.bashrc

# Apply changes
source $HOME/.bashrc

echo "Installation complete! You can now use 'piptools' command to start the tool."