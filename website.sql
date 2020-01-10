--Creator
--=======================
--Hoang Bui

--DELETE DATABASE TABLES
--=======================
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Experience;
DROP TABLE IF EXISTS Education;
DROP TABLE IF EXISTS Skill;
DROP TABLE IF EXISTS Tool;
DROP TABLE IF EXISTS OS;

--CREATE DATABASE TABLES
--=======================
CREATE TABLE IF NOT EXISTS Project(
    project_name TEXT NOT NULL UNIQUE, --project name
    date_start TEXT NOT NULL, --project start date
    date_end TEXT, --project end date
    project_type TEXT NOT NULL, --individual, team, and if applicable position
    project_status TEXT NOT NULL, --project status
    project_description TEXT NOT NULL, --project description
    goals TEXT NOT NULL, --project goals
    tools TEXT NOT NULL, --project tools
    image_file TEXT, --image if applicable
    link TEXT UNIQUE, --link to project
    primary key (project_name)
);
CREATE TABLE IF NOT EXISTS Experience(
    job_title TEXT NOT NULL, --Job title
    date_start TEXT NOT NULL, --start date
    date_end TEXT, --end date
    work_location TEXT NOT NULL, --work location
    job_description TEXT NOT NULL, --job description
    duties TEXT NOT NULL, --duties
    tools TEXT NOT NULL, --job tools
    links TEXT UNIQUE, --links associated with work
    primary key (job_title, work_location, date_start)
);
CREATE TABLE IF NOT EXISTS Education(
    term TEXT NOT NULL, --term
    course_name TEXT NOT NULL, --course name
    grade TEXT, --grade
    course_objective TEXT NOT NULL, --course objective
    primary key (term, course_name)
);
CREATE TABLE IF NOT EXISTS Skill(
    language_name TEXT NOT NULL, --Skill
    year_experience TEXT NOT NULL, --number of years of experience
    skill_level TEXT, --skill level
    primary key (language_name)
);
CREATE TABLE IF NOT EXISTS Tool(
    Tool_name TEXT NOT NULL, --Tool
    proficient_level INTEGER NOT NULL, --proficiency level from 1-3 1 being proficient
    primary key (Tool_name)
);
CREATE TABLE IF NOT EXISTS OS(
    OS TEXT NOT NULL, --OS
    proficient_level INTEGER NOT NULL, --proficiency level from 1-3 1 being proficient
    primary key (OS)
);
CREATE TABLE IF NOT EXISTS Book(
    title TEXT NOT NULL, --title
    authors TEXT NOT NULL, --authors
    tool TEXT NOT NULL, --tool
    link TEXT NOT NULL, --link
    primary key (title, authors)
);
--INSERT DATA
--=======================
begin transaction;
-- Projects
insert or replace into Project(project_name, date_start, date_end, project_type, project_status, project_description, goals, tools, image_file, link)
values(
    'Arduino Bot',
    '2015',
    null,
    "Independent Project",
    "Complete",
    "A bot that is designed to manuver through a maze using light sensors. Also added new feature where the bot will interact with a wii nunchuck's tilt controls to move",
    'Learn how to work with arduinos>>>Develope understanding of software interacting with hardware',
    'C, C++, Arduino Uno board, Arduino bot kit, Wii nunchuck',
    'arduino_bot_1.jpg, arduino_bot_2.jpg, arduino_bot_3.jpg, arduino_bot_4.jpg, arduino_bot_5.jpg',
    null
    );
insert or replace into Project(project_name, date_start, date_end, project_type, project_status, project_description, goals, tools, image_file, link)
values(
    'Time Is Knowledge [CU Hacking]',
    '2017',
    null,
    'Group Project',
    'Complete',
    "A web page that generate facts based on the amount of time measured by a timer.",
    'Learn how to create a webpage with HTML & CSS>>>Implement a timer>>>Generate facts',
    'HTML, CSS, JS',
    'time_is_knowledge_1.PNG, time_is_knowledge_2.PNG',
    'https://github.com/dershao/TimeIsKnowledge'
    );
insert or replace into Project(project_name, date_start, date_end, project_type, project_status, project_description, goals, tools, image_file, link)
values(
    'blinkSaver [Carleton University Terrible Hack Day]',
    '2017',
    null,
    'Group Project',
    'Complete',
    "Through the use of machine learning with opencv, this terrible hack will increase your computer's battery life by turning off the screen when you close your eyes (includes blinking). Of course, the battery used by the webcam would negate the battery saves but that's why it's a terrible hack. - Samuel Catherasoo",
    'Create a script that will lock the screen>>>Implement third-party code for facial recongnition',
    'Annaconda, OpenCV, Python',
    null,
    'https://github.com/samjjc/terribleHack'
    );
insert or replace into Project(project_name, date_start, date_end, project_type, project_status, project_description, goals, tools, image_file, link)
values(
    'Phone Payment Entry System for Redevelopment of Brewer Park',
    'Jul 2017',
    'Aug 2017',
    'Team Leader, Group Project',
    'Complete',
    "Conduct research on Phone payment Entry systems; the research is to be presented, and typed into a report of findings. The results are sent to Ottawa Councillor David Chernushenko for the redevelopment of Brewer Park.",
    'Present research to a non-technical audience to convey the benefits to install a Phone Payment Entry System>>>Learn the fundamentals for communication skills',
    'Microsoft Word, Microsoft PowerPoint, Google Docs, Google Slides',
    null,
    'https://drive.google.com/file/d/0B2hA4e9hFkttT1Ric3dMckpnMmc/view?usp=sharing'
    );
insert or replace into Project(project_name, date_start, date_end, project_type, project_status, project_description, goals, tools, image_file, link)
values(
    'Arduino Sensor Detection',
    'Dec 2017',
    null,
    'Group Project',
    'Complete',
    "Assemble a circuit to measure the distance of an object/person from a sensor.",
    'Understand how hardware will interact with software>>>Experience using hardware (arduino)',
    'Arduino, C, Circuits',
    null,
    'https://github.com/Weebian/Arduino-sensor-detection'
    );
insert or replace into Project(project_name, date_start, date_end, project_type, project_status, project_description, goals, tools, image_file, link)
values(
    'Feels Good [CU Hacking]',
    '2018',
    null,
    'Group Project',
    'Copmplete',
    "A web/windows application to assist people with depression.",
    'Take a picture, using the pc’s webcam, and analyze the image to determine the user’s mood>>>Further improved the application by creating a private chat room to interact with other people to consult and share experiences>>>Improve technical skills of HTML, CSS, JS to further improve future web applications',
    'HTML5, CSS, JS, Python, Indico API, OpenCV',
    null,
    'https://github.com/gitoutplayed/Cuhacking2018'
    );
insert or replace into Project(project_name, date_start, date_end, project_type, project_status, project_description, goals, tools, image_file, link)
values(
    'File Searcher',
    'Jan 2018',
    null,
    'Individual Project',
    'Complete',
    "A python script to assit in finding files with a specified keyword.",
    "Find files with a similar keyword>>>Practice using python's ability to traverse through directories>>>Improve coding proficiency of using python",
    'Python',
    'file_searcher.PNG',
    'https://github.com/Weebian/File-Searcher'
    );
insert or replace into Project(project_name, date_start, date_end, project_type, project_status, project_description, goals, tools, image_file, link)
values(
    'GBF bot',
    'Dec 2017',
    'March 2018',
    'Independent Project',
    'Abandonned',
    "GBF is a mobile/browser game. The bot is a script that will analyzes the screen, then perform tasks based on what's on the screen. Abandonned because the game's UI has improved, and lost interest in the game itself.",
    "React based on what appears on screen>>>Complete recusive tasks without user input",
    'Python, Open CV',
    null,
    null
);
insert or replace into Project(project_name, date_start, date_end, project_type, project_status, project_description, goals, tools, image_file, link)
values(
    'Granblue Fantasy simple calculator',
    'Jan 2018',
    null,
    'Individual Project',
    'Complete',
    "A python script to calculate how much ressource is required to sparking.",
    "Improve coding proficiency of using python's function and class",
    'Python',
    'simple_gbf_calc.PNG',
    'https://github.com/Weebian/Granblue-Fantasy-simple-calculator'
    );
insert or replace into Project(project_name, date_start, date_end, project_type, project_status, project_description, goals, tools, image_file, link)
values(
    'uOttaHack2019',
    'Feb 2019',
    null,
    'Group Project',
    'Complete',
    "For UOttaHack2019, the team created a program to assist in otaining data on drivers; detect the direct of where your eyes are looking, your current facial expression, and object detection of what's on the road.",
    "Improve coding proficiency using python>>>Learn new tools and techniques",
    'Python, Pygaze, Pygame, OpenCV',
    null,
    'https://github.com/silvs110/uOttaHack2019'
    );
insert or replace into Project(project_name, date_start, date_end, project_type, project_status, project_description, goals, tools, image_file, link)
values(
    'Granblue Fantasy Rate finder',
    'Jan 2018',
    'June 2019',
    'Individual Project',
    'Complete',
    "A python script that prints out the rates of item drops from Granblue Fantasy.",
    "Practice parsing through XML files>>>Practice using python's ability to traverse through XML using xml.etree.ElementTree>>>Improve coding proficiency of using python",
    'Python',
    'gbf_rate_finder.PNG',
    'https://github.com/Weebian/Granblue-Fantasy-Rate-finder'
    );
insert or replace into Project(project_name, date_start, date_end, project_type, project_status, project_description, goals, tools, image_file, link)
values(
    'Gbf Spark Calculator',
    'Jan 2019',
    'June 2019',
    'Independent Project',
    'Complete',
    "A website to calculate the number of draws required to spark in granblue fantasy.",
    "Improve skills with HTML5, CSS, and JS>>>Experiment with AngularJS",
    'HTML5, CSS, JS, AngularJS, Bootstrap, Font Awesome',
    'gbf_calc_1.PNG, gbf_calc_2.PNG',
    'https://github.com/Weebian/Gbf-Spark-Calculator'
    );
insert or replace into Project(project_name, date_start, date_end, project_type, project_status, project_description, goals, tools, image_file, link)
values(
    'Personal website [Old]',
    'Jan 2017',
    'Oct 2019',
    'Independent Project',
    'Complete',
    "Original website created to help represent my skills and qualities. Is currently left online to help others learn front-end web development.",
    "Reinforce understanding of W3C Guidelines>>>Improve skills with HTML5, CSS, and JS>>>Further understanding of JQuery",
    'HTML5, CSS, JS, JQuery, Bootstrap, Font Awesome, GitHub Pages',
    'personal_website_front_end.PNG',
    'weebian.github.io/, https://github.com/Weebian/weebian.github.io'
);
insert or replace into Project(project_name, date_start, date_end, project_type, project_status, project_description, goals, tools, image_file, link)
values(
    'Personalize Discord',
    'May 2019',
    null,
    'Independent Project',
    'On-going',
    "Discord is a webapp that uses Eletron. By using BetterDiscord JS, we can implement our own CSS file to restyle the UI",
    "Practice CSS skills>>>Improve debugging skills",
    'CSS',
    'discord_theme_1.PNG, discord_theme_2.PNG',
    null
);
insert or replace into Project(project_name, date_start, date_end, project_type, project_status, project_description, goals, tools, image_file, link)
values(
    'Natsuki_Subaru',
    'Sept 2019',
    null,
    'Independent Project',
    'On-going',
    "A simple discord bot to analyze commands, and respond accordingly. Designed to reply back to messages and play youtube videos through Discord",
    "Practice text querying>>>Attempt simple functionality with JS",
    'JS, Node JS, Discord JS',
    'subaru_bot.PNG',
    'https://github.com/Weebian/Natsuki_Subaru'
);
insert or replace into Project(project_name, date_start, date_end, project_type, project_status, project_description, goals, tools, image_file, link)
values(
    'Personal Website [Current website]',
    'Oct 2019',
    null,
    'Independent Project',
    'On-going',
    "Current website created to help represent my skills and qualities. Hosted on a Raspberry PI and ran using Flask",
    "Reinforce understanding of W3C Guidelines>>>Improve skills with HTML5, CSS, and JS>>>Learn the usage of JS framworks with Vue JS>>>Further understanding of backend programming using Python, Flask, and SQLAlchemy",
    'HTML5, CSS, JS, Bootstrap, Font Awesome, GitHub Pages, Vue JS, Python, Flask, SQLAlchemy, SQLite, Raspberry Pi, Raspbian',
    null,
    'https://github.com/Weebian/personal_website'
);
--Experiences
insert or replace into Experience(job_title, date_start, date_end, work_location, job_description, duties, tools, links)
values(
    'Co-op Graphic Designer',
    'Jul 2015',
    'Aug 2015',
    'Corel Corporation, Ottawa, Ontario, Canada',
    'Work in adjacent with two other co-op students to test ParticleShop and discuss about the UI of ParticleShop.',
    "Create front images for ParticleShop on the Corel's online store>>>Partake in conversations and discussion on how to improve, and what are the faults in ParticleShop",
    'ParticleShop, Photoshop, Corel Painter',
    'https://www.painterartist.com/en/product/painter/brushes/'
);
insert or replace into Experience(job_title, date_start, date_end, work_location, job_description, duties, tools, links)
values(
    'Co-op Front-End Web Developer',
    'Apr 2018',
    'Aug 2018',
    'The Canadian Medical Protective Association, Ottawa, Ontario, Canada',
    "The position of front-end web development takes part with The Canadian Medical Protective Association's AI&D support team. Within the team's agile workplace environment, we are to take part in meetings and conversions on how to improve web application and web content.",
    "Create web page for Summary of Annual Report>>>Updated/Create and deployed web pages for news reports and articles>>>Updated Employee's portal>>>Create a HTML5 e-learning program to replace the current Flash e-learning programs>>>Create and updated PDF generator for Residence symposiums and Workshops",
    'Crafter CRM, HTML5, CSS3, JS, JQuery, Bootstrap, XHTML, PDFMaker, Confluence, Jenkins, GitHub, SVN, Bitbucket, FishEye',
    'https://www.cmpa-acpm.ca/en/about/annual-report, https://www.cmpa-acpm.ca/en/advice-publications/cmpa-perspective'
);
insert or replace into Experience(job_title, date_start, date_end, work_location, job_description, duties, tools, links)
values(
    'Peer tutor for "Communication skills for Engineers"',
    'Sept 2018',
    'Dec 2018',
    'Carleton University, Ottawa, Ontario, Canada',
    "In Communication skills for engineers, students within the course are to research on topics that are part of a major project that benefits the community. The topics are created by the peer tutor, then separated into four subtopics. This term, the project is to improve the energy consumption of a Condo Building located in Ottawa.",
    "Create research topics to reduce energy consumption>>>Review engineering principles that students use within their reports & presentation>>>Discuss with students in meetings of the goal of each topic and how each subtopic contributes to the topic",
    'Microsoft Word, Microsoft PowerPoint',
    null
);
insert or replace into Experience(job_title, date_start, date_end, work_location, job_description, duties, tools, links)
values(
    'Engineer Co-op',
    'Jan 2019',
    'Dec 2019',
    'Gemalto - Thales, Ottawa, Ontario, Canada',
    "The position of Engineer Co-op is to develop or maintain solutions that will be used by other coworkers to assist or improve current or future projects. Many of these projects involves making tools for IP migration. Also work with the software side of one of the company's product, a G7. Mainly focus on the G7's interaction with a smartcard.",
    "Create/Clone VMs for other users, or to install tools onto the VMs>>>Create a DNS and DHCP server out of Windows Server 2016 to assit with the IP magration and provide a tool for simpler changes to anb asset's IP>>>Develop an online form for users to submit a list of their assets>>>Maintain a website for data reports regarding appliances>>>Implement a blog for the Lab management team as a change log for appliances>>>Implement features for smartcard interaction with G7>>>Fix bugs that affects either the GUI or process",
    'C, C++, VS Code, Qt, VM Ware, Windows, Linux, HTML, CSS, JS, SQL, PHP',
    null
);
--Courses
--  Fall 2016 (Sept - Dec)
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Fall 2016 (Sept - Dec)',
    'Introduction to Engineering [ECOR 1010]',
    'B',
    'Knowledge base of engineering fundamentals related to engineering measurements, engineering graphics, measurements statistics and uncertainty, and engineering software.+++Problem analysis applied to knowledge base components above+++Understand Professional Engineering in Canada, Project Planning and Scheduling, Safety in Engineering Design, and Environmental Sustainability.'
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Fall 2016 (Sept - Dec)',
    'Calculus for Engineering or Physics [MATH 1004]',
    'B+',
    'Learn and understand concepts related to differential and integral calculus.+++Learn, understand and properly use techniques pertaining to these disciplines.'
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Fall 2016 (Sept - Dec)',
    'Linear Algebra for Engineering or Science [MATH 1104]',
    'A',
    'Learn and understand concepts related to Linear Algebra.'
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Fall 2016 (Sept - Dec)',
    'Introductory Mechanics and Thermodynamics [PHYS 1003]',
    'A-',
    'Emphasis on engineering applications and applied physics+++Overview of mechanics, relativity, discusses laws of conservation in mechanics, oscillations, and thermodynamics.'
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Fall 2016 (Sept - Dec)',
    'Introduction to Software Development [SYSC 1005]',
    'A+',
    'Be able to evaluate expressions consisting of literal values, variables and operators, using the same evaluation rules as Python. In other words, students should be able to predict the values that Python calculates when it evaluates expressions.+++Know the syntax and semantics of the fundamental control constructs provided by Python. These constructs include: sequential execution as determined by the ordering of executable statements; selection (if, if­-else and if -elif-­else statements); repetition (for and while statements); function calls.+++Be able to trace the execution of short programs+++Be able to design and implement functions that satisfy detailed specifications. Students should be able to use the Python shell to interactively test their functions. Students should be able to apply simple debugging techniques (e.g., inserting print statements to instrument code) to locate faults in their code.+++Be able to iteratively and incrementally design, implement and test a small­scale, interactive program that is partitioned into multiple modules, given a detailed specification of the functional requirements.+++Know the "client­side" view of four abstract collections for organizing data, namely: lists, tuples, sets and dictionaries. Students should be able to select and use appropriate Python collection(s) in their programs.'
);
--  Winter 2017 (Jan - Apr)
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Winter 2017 (Jan - Apr)',
    'Chemistry for Engineering Students [CHEM 1101]',
    'A-',
    'Learning general Chemistry'
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Winter 2017 (Jan - Apr)',
    'Mechanics I [ECOR 1101]',
    'C+',
    'Apply the correct units, notation, significant digits and conversion factors when solving engineering problems.+++Apply a vector formulation when solving Mechanics problems.+++Calculate the coordinates of the centroid or center of gravity of 2D and 3D objects.+++Calculate the effect of forces and moments on 2D and 3D rigid objects.+++Analyze the equilibrium conditions of particles and rigid bodies in 2D and 3D space.+++Calculate kinematic variables in the motion of particles and rigid bodies (modelled as particles) under the action of forces and moments in 2D and 3D space.'
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Winter 2017 (Jan - Apr)',
    'Differential Equations and Infinite Series for Engineering or Physics [MATH 1005]',
    'B',
    'Learning fundamentals to differential Equations and Infinite Series'
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Winter 2017 (Jan - Apr)',
    'Introductory Electromagnetism and Wave Motion [PHYS 1004]',
    'A-',
    'Introduces electricity, magnetism, oscillations, waves and optics'
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Winter 2017 (Jan - Apr)',
    'Foundations of Imperative Programming [SYSC 2006]',
    'A+',
    'Understand the concepts that underlie most imperative programming languages and be able to use this knowledge to help them learn new languages+++Understand how memory is managed by an executing program, and demonstrate this knowledge pictorially+++Be able to implement small-scale, modular programs in an imperative programming language+++Understand different designs for simple abstract linear collections such as lists (vectors), and (if time permits) queues and stacks+++Be able to construct simple recursive functions+++Be prepared to undertake a course that provides a thorough introduction to object-oriented programming principles'
);
--  Summer 2017 (May - Aug)
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Summer 2017 (May - Aug)',
    'Communication Skills for Engineering Students [CCDP 2100]',
    'A+',
    'Analyze a writing or presentation requirement by considering both purpose and audience+++Develop a suitable, logical, and comprehensible written or oral response to that requirement by considering<ol><li>Audience awareness (which includes style and tone)</li><li>Content (which includes accuracy and relevance)</li><li>Organisation (which includes the logical flow of ideas)</li><li>Format (which includes accessibility of information)</li><li>Language use (which includes accurate grammar, correct spelling, and precise word choice)</li></ol>+++Work effectively as a part of a team.'
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Summer 2017 (May - Aug)',
    'Survey of Roman Civilization [CLCV 1003]',
    'A-',
    "Introduction to roman history, culture, and how it influenced today's culture"
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Summer 2017 (May - Aug)',
    'Multivariable Calculus for Engineering or Physics [MATH 2004]',
    'A-',
    "Introduction to multivariable calculus+++Improve students' foundation in mathematics"
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Summer 2017 (May - Aug)',
    'Multivariable Calculus for Engineering or Physics [PHIL 2003]',
    'A-',
    "Improving critical thinking skills by:<ul><li>Recognizing when an argument is being presented</li><li>Identifying precisely what the premises and conclusion of the argument are</li><li>Spoting any fallacies it happens to commit</li><li>Providing an overall evaluation of the argument.</li></ul>"
);
--  Fall 2017 (Sept - Dec)
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Fall 2017 (Sept - Dec)',
    'Circuits and Signals [ELEC 2501]',
    'A-',
    "Use appropriate SI units for currents, voltages and circuit elements+++Define voltage, current, power and their relationships+++Define and apply Ohm's law+++Apply voltage and current division in circuits+++Analyze electric circuits to determine voltage and currents in the network+++Analyze electrical circuits using the principle of superposition+++Calculate Thévenin and Norton equivalent circuits for linear circuits+++Apply maximum power transfer theorem to determine optimal load+++Use circuit models for inductors and capacitors to calculate voltages, currents and powers+++Apply circuit analysis techniques to frequency-domain circuits+++Analyze series and parallel resonant circuits to determine voltages and currents in circuit"
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Fall 2017 (Sept - Dec)',
    'Probability and Statistics [STAT 3502]',
    'B+',
    "Introduction to Probability+++Introduction to Statistics+++Understanding distributions, axioms etc."
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Fall 2017 (Sept - Dec)',
    'Object-Oriented Software Development [SYSC 2004]',
    'A+',
    "Designing and implementing small-scale programs as communities of collaborating objects+++using a dynamically-typed or statically-typed programming language+++Fundamental concepts:<ul><li>Classes</li><li>Objects</li><li>Encapsulation</li><li>Information hiding</li><li>Inheritance</li><li>polymorphism</li></ul>+++Iterative, incremental development and test-driven development."
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Fall 2017 (Sept - Dec)',
    'Introduction to Digital Systems [SYSC 2310]',
    'B',
    "Prerequisite knowledge needed to study digital systems in more detail"
);
--  Winter 2018 (Jan - Apr)
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Winter 2018 (Jan - Apr)',
    'Discrete Structures I [COMP 1805]',
    'A-',
    "Construct arguments and formal proofs using multiple different techniques+++Solve expressions using arithmetic, propositional and predicate logic, and set theory+++Perform asymptotic analyses to describe the performance of different algorithms+++Explain the following topics:<ul><li>Conjunction, disjunction, negation, implication, existential/universal quantification</li><li>union, intersection, functions, relations, countability, and the universe(s) of discourse</li><li>time complexity, asymptotic analysis</li><li>sequences, sums, and graphs</li></ul>"
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Winter 2018 (Jan - Apr)',
    'Algorithms and Data Structures [SYSC 2100]',
    'A',
    "Gain ability to intuitively analyze the complexity of basic algorithms+++Gain ability in choosing the appropriate data structures and algorithms for a given application"
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Winter 2018 (Jan - Apr)',
    'Introduction to Computer Organization and Architecture [SYSC 2100]',
    'A+',
    "Fundamentals of organization of computer systems at the hardware/software interface+++Understand computer systems and concepts which form the foundation that powerful computer systems are based on"
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Winter 2018 (Jan - Apr)',
    'Programming Languages [SYSC 3101]',
    'A-',
    "Principles underlying different kinds of programming languages (procedural, functional, logic programming) and their semantics+++Overview of machinery needed for language support (compilers, interpreters and run-time systems)"
);
--  Fall 2018 (Sept - Dec)
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Fall 2018 (Sept - Dec)',
    'Database Management Systems [COMP 3005]',
    'A',
    "Introduces students to concepts of database management systems, database design and file structures"
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Fall 2018 (Sept - Dec)',
    'Engineering Economics [ECOR 3800]',
    'B+',
    "To introduce the concepts and methods of engineering economics+++To develop the required skills in economic analysis to make sound economic and financial decisions+++To improve the efficient use of available resources in engineering projects"
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Fall 2018 (Sept - Dec)',
    'Software Development Project [SYSC 3110]',
    'A',
    "Development of expertise in designing, implementing, and testing industrialquality, reusable code through individual and team projects.+++Applying and extending previously acquired knowledge of patterns, frameworks, UML, iterative and incremental development, to medium and large-scale systems"
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Fall 2018 (Sept - Dec)',
    'Intro to Real-Time Systems [SYSC 3310]',
    'A',
    "To learn the fundamental concepts of embedded systems, event-driven programming and real-time programming+++To gain experience applying these concepts by implementing small-scale programs as communities of interacting (collaborating) objects on a sample microcontroller platform equipped with a variety of peripheral devices+++To learn and apply some lightweight, modern techniques commonly used during embedded software development (iterative, incremental development; test-driven development)+++To develop the ability to build software experiments as an aid to learning."
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Fall 2018 (Sept - Dec)',
    'Fundamentals of Web Development [SYSC 4504]',
    'A-',
    "Discuss the fundamental concepts and the software solutions, in the design of a distributed system, in particular the use of WWW-related technologies"
);
-- Current Course
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Winter 2020 (Dec - Apr)',
    'Software Requirements Engineering [SYSC 3120]',
    null,
    "Current techniques, notations, methods, processes and tools used in Requirements Engineering.+++Requirements elicitation, negotiation, modeling requirements, management, validation. Skills needed for Requirements Engineering and the many disciplines on which it draws.+++Requirements analysis: domain modeling, modeling object interactions; UML modeling.+++Introduction to software development processes."
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Winter 2020 (Dec - Apr)',
    'Real-Time Concurrent Systems [SYSC 3303]',
    null,
    "Principles and practice of a systems engineering approach to the development of software for real-time, concurrent, distributed systems.+++Designing to achieve concurrency, performance, and robustness, using visual notations.+++Converting designs into programs.+++Introduction to hard real-time systems.+++Team project."
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Winter 2020 (Dec - Apr)',
    'Operating Systems [SYSC 4001]',
    null,
    "Introduction to operating system principles.+++Processes and threads.+++CPU scheduling.+++Managing concurrency: mutual exclusion and synchronization, deadlock and starvation. Managing memory and input/output.+++Concurrent programming, including interprocess communication in distributed systems."
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Winter 2020 (Dec - Apr)',
    'The Software Economy and Project Management [SYSC 4106]',
    null,
    "Introduction to software project management and economics+++Return on software investments+++Software life cycle+++Work breakdown structure, scheduling and planning+++Risk analysis and management+++Product size and cost estimation+++Earn value management+++Statistical process control+++Managing project team and process improvement+++Bidding and contract types."
);
insert or replace into Education(term, course_name, grade, course_objective)
values(
    'Winter 2020 (Dec - Apr)',
    'Human Computer Interaction [COMP 3008]',
    null,
    "Fundamentals of the underlying theories, design principles, development and evaluation practices of human-computer interaction(HCI).Topics may include: theories of interaction, user interface frameworks, desktop, web, mobile, and immersive applications, usability inspection and testing methods, and qualitative and quantitative approaches to HCI research."
);
-- Skills
insert or replace into Skill(language_name, year_experience, skill_level)
values(
    'Java',
    '3',
    "Intermediate"
);
insert or replace into Skill(language_name, year_experience, skill_level)
values(
    'HTML5',
    '5',
    "Expert"
);
insert or replace into Skill(language_name, year_experience, skill_level)
values(
    'CSS3',
    '5',
    "Expert"
);
insert or replace into Skill(language_name, year_experience, skill_level)
values(
    'JavaScript',
    '3',
    "Intermediate"
);
insert or replace into Skill(language_name, year_experience, skill_level)
values(
    'Python',
    '6',
    "Intermediate"
);
insert or replace into Skill(language_name, year_experience, skill_level)
values(
    'C++',
    '2',
    "Novice"
);
insert or replace into Skill(language_name, year_experience, skill_level)
values(
    'C',
    '2',
    "Novice"
);
insert or replace into Skill(language_name, year_experience, skill_level)
values(
    'SQLite',
    '2',
    "Intermediate"
);
insert or replace into Skill(language_name, year_experience, skill_level)
values(
    'Postgresql',
    '0.5',
    "Novice"
);
insert or replace into Skill(language_name, year_experience, skill_level)
values(
    'PHP',
    '1',
    "Novice"
);
insert or replace into Skill(language_name, year_experience, skill_level)
values(
    'Node.js',
    '1',
    "Novice"
);
insert or replace into Skill(language_name, year_experience, skill_level)
values(
    'C#',
    '0.5',
    "Novice"
);
insert or replace into Skill(language_name, year_experience, skill_level)
values(
    'Ansible',
    '0.5',
    "Novice"
);
--Tools
insert or replace into Tool(Tool_name, proficient_level)
values(
    'Git',
    1
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'Visual Studio',
    1
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'Bootstrap',
    1
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'jQuery',
    1
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'VM ware',
    1
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'Virtual Box',
    1
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'UML',
    1
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'Bash Scripting',
    1
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'Raspberry Pi',
    1
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'Jinja',
    1
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'JUnit',
    1
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'JSON',
    1
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'XML',
    1
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'TCP/IP protocols',
    2
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'Arduino',
    2
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'JIRA',
    2
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'Flask',
    2
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'SQLAlchemy',
    2
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'Pandas',
    3
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'Vue Js',
    3
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'SVN',
    3
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'Angular Js',
    3
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'React Js',
    3
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'Android Studio',
    3
);
insert or replace into Tool(Tool_name, proficient_level)
values(
    'Qt',
    3
);
--OS
insert or replace into OS(OS, proficient_level)
values(
    'Windows 10',
    1
);
insert or replace into OS(OS, proficient_level)
values(
    'CentOS 7',
    1
);
insert or replace into OS(OS, proficient_level)
values(
    'MintOS',
    1
);
insert or replace into OS(OS, proficient_level)
values(
    'Raspbian',
    1
);
insert or replace into OS(OS, proficient_level)
values(
    'Windows Server 2016',
    2
);
insert or replace into OS(OS, proficient_level)
values(
    'Windows Server 2019',
    2
);
insert or replace into OS(OS, proficient_level)
values(
    'Manjaro',
    3
);
insert or replace into OS(OS, proficient_level)
values(
    'Mx Linux',
    3
);
insert or replace into OS(OS, proficient_level)
values(
    'Chrome OS',
    2
);
--Books
insert or replace into Book(title, authors, tool, link)
values(
    'Mastering Python',
    'Rick van Hattem',
    'Python',
    'https://www.packtpub.com/application-development/mastering-python'
);
insert or replace into Book(title, authors, tool, link)
values(
    'Learning Python',
    'Fabrizio Romano',
    'Python',
    'https://www.packtpub.com/application-development/learning-python'
);
insert or replace into Book(title, authors, tool, link)
values(
    'Cybersecurity - Attack and Defense Strategies',
    'Yuri Diogenes, Erdal Ozkaya',
    'Cybersecurity',
    'https://www.packtpub.com/networking-and-servers/cybersecurity-attack-and-defense-strategies'
);
--Placeholder
end transaction;