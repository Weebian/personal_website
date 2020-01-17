from flask import render_template, url_for, flash, redirect
from app import app
from sqlalchemy.ext.automap import automap_base
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy(app)

Base = automap_base()
Base.prepare(db.engine, reflect=True)
project_table = Base.classes.Project
experience_table = Base.classes.Experience
education_table = Base.classes.Education
skill_table = Base.classes.Skill
tool_table = Base.classes.Tool
editor_table = Base.classes.Editor
OS_table = Base.classes.OS
book_table = Base.classes.Book

@app.route('/')
def index():
    return render_template(
        'index.html',
        title='Home',
        intro='GREETINGS TRAVELER',
        message='I bid you a warm welcome',
    )

# Work experience
@app.route('/experience')
def experience_page():
    # Obtain all jobs
    jobs = db.session.query(experience_table).all()
    job_list = []
    tools = [] # List of tools and ressources

    for job in jobs:
        # Check if there are links
        if job.links != None:
            link = job.links.split(', ')
        else:
            link = job.links
        # Create dict and append to list of projects
        job_list.insert(0, {
            'job_title' : job.job_title,
            'date_start' : job.date_start,
            'date_end' : job.date_end,
            'work_location' : job.work_location,
            'job_description' : job.job_description,
            'duties' : job.duties.split('>>>'),
            'tools' : job.tools.split(', '),
            'links' : link
        })
        # Add tool to list
        tools += job.tools.split(', ')

    return render_template(
        'experience.html',
        title='Experience',
        intro='A LIFETIME OF ADVENTURE',
        message='"Inspiration usually comes during work rather than before it." - Madeleine L\'Engle',
        job_list = job_list,
        tools = sorted(set(tools)),
    )

# Projects
@app.route('/project')
def project_page():
    # Obtain all projects
    projects = db.session.query(project_table).all()
    project_list = []
    tools = [] # List of tools and ressources

    for project in projects:
        # Check if there are images
        if project.image_file != None:
            images = project.image_file.split(", ")
        else:
            images = project.image_file
        # Check if there are links
        if project.link != None:
            link = project.link.split(', ')
        else:
            link = project.link
        # Create dict and append to list of projects
        project_list.insert(0, {
            'project_name' : project.project_name,
            'date_start' : project.date_start,
            'date_end' : project.date_end,
            'project_type' : project.project_type,
            'project_status' : project.project_status,
            'project_description' : project.project_description,
            'goals' : project.goals.split('>>>'),
            'tools' : project.tools.split(', '),
            'image_files' : images,
            'links' : link
        })
        # Add tool to list
        tools += project.tools.split(', ')

    return render_template(
        'project.html',
        title='Project',
        intro='DIVING INTO THE UNKNOWN',
        message='"If you have a strong purpose in life, you don\'t have to be pushed. Your passion will drive you there." - Roy T. Bennett',
        project_list = project_list,
        tools = sorted(set(tools)),
    )

# Education
@app.route('/education')
def education_page():
    # Obtain all jobs
    courses = db.session.query(education_table).all()
    course_list = []
    terms = [] # List of tools and ressources

    for course in courses:
        # Create dict and append to list of projects
        course_list.insert(0, {
            'term' : course.term,
            'course_name' : course.course_name,
            'grade' : course.grade,
            'course_objective' : course.course_objective.split('+++')
        })
        # Add term to list
        if not course.term in terms and course.grade != None:
            terms.append(course.term)

    return render_template(
        'education.html',
        title='Education',
        intro='ONE STEP AT A TIME',
        message='"A man who asks is a fool for five minutes. A man who never asks is a fool for life." - Chinese Proverb',
        course_list=[x for x in course_list if x['grade'] != None],
        terms=terms[::-1],
        current_list=[x for x in course_list if x['grade'] == None],
        current_empty = len([x for x in course_list if x['grade'] == None]) == 0
    )

#Skills
@app.route('/skill')
def skill_page():
    #Obtain all values
    skills = db.session.query(skill_table).all()
    tools = db.session.query(tool_table).all()
    editors = db.session.query(editor_table).all()
    OSs = db.session.query(OS_table).all()
    
    #Skill's table
    skill_list = sorted([skill.language_name for skill in skills])
    for skill in skills:
        skill_list[skill_list.index(skill.language_name)] = {
            'name' : skill.language_name,
            'experience' : skill.year_experience,
            'level' : skill.skill_level
        }
    
    #Tools
    proficient_tool = sorted([tool.Tool_name for tool in tools if tool.proficient_level == 1])
    somewhat_proficient_tool = sorted([tool.Tool_name for tool in tools if tool.proficient_level == 2])
    non_proficient_tool = sorted([tool.Tool_name for tool in tools if tool.proficient_level == 3])

    #Editors
    proficient_editor = sorted([editor.editor_name for editor in editors if editor.proficient_level == 1])
    somewhat_proficient_editor = sorted([editor.editor_name for editor in editors if editor.proficient_level == 2])
    non_proficient_editor = sorted([editor.editor_name for editor in editors if editor.proficient_level == 3])

    #OS
    proficient_OS = sorted([OS.OS for OS in OSs if OS.proficient_level == 1])
    somewhat_proficient_OS = sorted([OS.OS for OS in OSs if OS.proficient_level == 2])
    non_proficient_OS = sorted([OS.OS for OS in OSs if OS.proficient_level == 3])
    
    return render_template(
        'skill.html',
        title='Skills',
        intro='Brain power',
        message='"I am not afraid of storms for I am learning how to sail my ship." - Louisa May Alcott',
        skill_list=skill_list,
        proficient_tool=proficient_tool,
        somewhat_proficient_tool=somewhat_proficient_tool,
        non_proficient_tool=non_proficient_tool,
        proficient_editor=proficient_editor,
        somewhat_proficient_editor=somewhat_proficient_editor,
        non_proficient_editor=non_proficient_editor,
        proficient_OS=proficient_OS,
        somewhat_proficient_OS=somewhat_proficient_OS,
        non_proficient_OS=non_proficient_OS
    )

# Self-studies
@app.route('/self-studies')
def study_page():
    #Obtain all values
    books = db.session.query(book_table).all()
    book_list = sorted([book.title for book in books])

    for book in books:
        book_list[book_list.index(book.title)] = {
            'title' : book.title,
            'authors' : book.authors,
            'tool' : book.tool,
            'link' : book.link
        }

    return render_template(
        'studies.html',
        title='Self-Studies',
        intro='Adrenaline is pumping',
        message='"Even when our eyes are closed, there\'s a whole world that exists outside ourselves and our dreams." - Hiromu Arakawa',
        book_list=book_list,
    )

# Contact
@app.route('/contact')
def contact_page():
    return render_template(
        'contact.html',
        title='Contact',
        intro='REACH OUT',
        message='"Invisible threads are the strongest ties." - Friedrich Nietzsche',
    )