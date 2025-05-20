Assignment #1: Creating Containers

Hide Assignment Information
Instructions
Containerizing an Application with Docker
Total Marks: 10%
Objective

The idea of this assignment is to practice creating Docker image(s) and containers while adhering to some of the Docker best practices we've covered so far in the class.

Assignment
You are tasked with containerizing an application of your choice using Docker. The application can be any type you prefer, such as a static HTML page, a Python Flask app, a Node.js app, or any other small-scale application you feel comfortable with. The goal is to demonstrate your understanding of Docker fundamentals, best practice.

Part 1: Writing a Dockerfile
Application Setup (4 Marks)
Choose an application and ensure it runs successfully on your local machine.
Provide the application files.
Dockerfile Creation (6 Marks)
Base Image: Use an official base image that is minimal and well-suited to your application (e.g., Alpine-based images for lightweight builds).
Best Practices:
Limit the number of layers in the Dockerfile to reduce image size.
Use multi-stage builds if needed (for compiling code, etc.) to minimize the final image size.
Avoid using :latest tags for your base image. Use a specific, stable version.
Use COPY or ADD to add your source code into the image (do not add unnecessary files).
Set proper environment variables where necessary (e.g., ENV, ARG).
Ensure the application runs in non-root user mode for security purposes.
Expose the necessary port(s) used by the web application (e.g., EXPOSE 8080).
Use volumes for persistent storage, if necessary.
Your Dockerfile MUST:
Install the necessary dependencies relate to your application.
Add your application source code.
Set up the command or entry point to run the web application.
Have necessary comments wherever possible
Part 2: Build the Docker Image
Build your Docker image using the docker build command from the directory containing your Dockerfile.

Part 3: Running the Container
Run a container from your newly built image, ensuring that it maps the appropriate port on your machine to the port exposed in your Dockerfile and attaches necessary volume.

Notes:
Your Docker Image Tag MUST have some sort of a version number or date stamp instead of "latest".
Submission
You will be submitting following into eConestoga:

A zipped folder containing:
Dockerfile
Screenshot 1: Provide a screenshot showing the Docker image creation process using docker build.
Screenshot 2: Provide a screenshot showing the running container and the accessible web application on your local machine.
Application files (e.g., code, configuration, or HTML files and make sure to EXCLUDE node_modules folder if you have one).
A short report (maximum 300 words) explaining:
The steps you followed to containerize the application.
How you implemented volumes or bind mounts and their purpose.
Any challenges faced and how you resolved them.
Due on May 23, 2025 11:59 PM
