author: Arie M. Prasetyo
summary: GitHub Copilot Workshop for Github Universe Recap 2025 Jakarta Indonesia
id: github-copilot-workshop-id
categories: AI, Development
environments: Web
status: Published
feedback link: https://example.com/feedback

# GitHub Copilot Workshop


## About the Workshop
Duration: 5

Welcome to the GitHub Copilot Workshop! In this workshop, you will learn how to use GitHub Copilot to explain and improve code.
GitHub Copilot Chat enables interactive dialogue with AI through a chat experience. Let's learn how to use GitHub Copilot through this workshop!

![GitHub Copilot Logo](github-copilot-workshop-id/img/__octocat_copilot.png)

### Today's Goals

- Understand the various features of GitHub Copilot
- Develop a new application using agent mode

### Prerequisites

- Visual Studio Code is installed
- GitHub Copilot license is available
- GitHub account is available



## Project Setup
Duration: 15

This workshop uses the following GitHub repository:

**Project URL**: [https://github.com/arisetyo/2025-github-ur-copilot-workshop](https://github.com/arisetyo/2025-github-ur-copilot-workshop)

### Step 1: Fork the Repository

First, open the project URL above in your browser and fork the repository:

1. Open the project URL in your browser
2. Click the **Fork** button in the top right

![Click Fork button](github-copilot-workshop-id/img/__fork-step1.png)

3. Click the `Create fork button` on the fork creation screen. Once the fork is complete, a copy of the repository will be created in your GitHub account.

### Step 2: Development Environment Setup

Using your forked repository, you can start the project using one of the following methods:

#### Method A: Use "GitHub Codespaces"

1. On your forked repository page from the previous step, click the green **Code** button
3. Select the **Codespaces** tab
4. Click **Create codespace on main**

![Codespaces Setup](github-copilot-workshop-id/img/__github-codespaces.png)

> aside positive
>
> **Tip**: Using Codespaces launches a VS Code-like environment in your browser, allowing you to start development immediately.

#### Method B: Clone to Local Environment

If you have VSCode installed locally:

1. Open Terminal or Command Prompt
2. Clone your forked repository with the following command:

```bash
git clone https://github.com/[your-username]/2025-github-ur-copilot-workshop.git
```

3. Navigate to the cloned directory:

```bash
cd 2025-github-ur-copilot-workshop
```

4. Open the project in VSCode

### Step 3: Workspace Setup

After opening the project, please install the following extensions:

1. Install **GitHub Copilot** extension
2. Install **GitHub Copilot Chat** extension
3. Install **Python** extension



## Configuration Check
Duration: 10

### Branch Preparation

Create and switch to the `feature/pomodoro` branch:

```bash
git checkout -b feature/pomodoro
```

1. Confirm that you are signed in to your GitHub account in VSCode
2. Confirm that Copilot functionality is enabled
3. Confirm that the Python interpreter is set up correctly

### Next Edit Suggestions Setup

⚙️ [`github.copilot.nextEditSuggestions.enabled`](vscode://settings/github.copilot.nextEditSuggestions.enabled) is a setting that enables GitHub Copilot's next-generation edit suggestion feature. This feature allows you to receive more advanced code editing suggestions.

### 1. Open VS Code

### 2. Access Settings
Open the settings screen using one of the following methods:

#### Method A: From Menu
- **Windows/Linux**: `File` → `Preferences` → `Settings`
- **macOS**: `Code` → `Settings...` → `Settings`

#### Method B: Keyboard Shortcut
- **Windows/Linux**: `Ctrl + ,`
- **macOS**: `Cmd + ,`

#### Method C: Command Palette
- `Ctrl + Shift + P` (Windows/Linux) or `Cmd + Shift + P` (macOS)
- Select `Preferences: Open Settings (UI)`

### 3. Search Settings
Enter the following in the settings search box:
```text
github.copilot.nextEditSuggestions.enabled
```

### 4. Enable Setting
- Check the checkbox for the setting item shown in search results
- Or change `false` to `true`

### 5. Confirm Setting
Verify the setting is correctly applied:
- Restart VSCode (recommended)
- Edit code in the editor and confirm the new suggestion feature works

### Alternative Method: Direct Edit in settings.json

#### 1. Open settings.json file
- `Ctrl + Shift + P` (Windows/Linux) or `Cmd + Shift + P` (macOS)
- Select `Preferences: Open User Settings (JSON)`

#### 2. Add Setting
```json
{
    "github.copilot.nextEditSuggestions.enabled": true
}
```

#### 3. Save File
- `Ctrl + S` (Windows/Linux) or `Cmd + S` (macOS)

### Important Notes

- Make sure VSCode's GitHub Copilot extension is updated to the latest version
- Restarting VSCode is recommended after setting changes

### Troubleshooting

#### If Settings Are Not Found
1. Confirm GitHub Copilot extension is installed
2. Confirm extension is updated to the latest version
3. Restart VSCode and try again

#### If Functionality Doesn't Work
1. Confirm you are logged in to GitHub Copilot
2. Check internet connection
3. Check VSCode console for error messages


## Creating the Pomodoro app
Duration: 10

In this hands-on, we'll develop a Pomodoro timer application. This application has functionality to set work time and break time and manage timers.

We aim to create an application with the following UI:

![Pomodoro Timer UI](github-copilot-workshop-id/img/__pomodoro.png)

Let's first create a new Python file in VS Code. Since we want to create this as a web application, we'll use FastAPI. Let's name the main file "server.py".

### Project Overview

Create a web timer application for the Pomodoro Technique.

### Required Features

These are the required feature for the MVP:

- 25-minute work timer
- 5-minute break timer
- Timer start/stop/reset
- Progress display
- Responsive web UI


## Think About Pomodoro Timer Design
Duration: 15

First, rather than starting implementation immediately, let's consult with Copilot about what approach and design to proceed with. From here on, we'll proceed entirely in agent mode.

What's helpful when creating a web application with UI like this is Copilot Chat's image upload functionality. Using this, you can make Copilot understand your application's UI image.

### Architecture

Type `#` in the chat field and wrote the name of the UI image: `pomodoro.png`.

Once the image is uploaded, it will be displayed in Copilot Chat.

![VS Code Copilot Chat Context Menu](github-copilot-workshop-id/img/__add-context.png)

Then, enter the following prompt:

```text
We plan to create a simple Pomodoro timer web app in this project to learn the aspects of Github Copilot. The attached image is a UI mock for that app. What design should we proceed with to create this app using FastAPI and HTML/CSS/JavaScript? Please suggest an architecture.
```

It will then suggest a recommended web application architecture.

> aside positive
>
> If there are points that should be improved or considerations that are lacking in this architecture, try pointing them out. For example, the following suggestion: "Considering the ease of unit testing, please also list any improvements or additions needed to the current architecture."

After this exchange, once the architectural design is settled, let's save that content to a file once, `architecture.md`. By doing so, you can reference the same architectural content even if you open a different chat session.
```text
Since the architecture has been settled through our conversation so far, please compile a web application architecture proposal in a file called architecture.md in `docs/` directory, based on the content of our conversation.
```

> aside negative
>
> Don't forget to click "Keep" to save the changes.

> aside positive
>
> When a conversation with Copilot Chat reaches a conclusion, you can give clearer instructions to Copilot by starting a new conversation. To start a new conversation, click the "New conversation" button at the top of the chat window. At that time, content you want to reference in future chats, like the architectural content this time, is convenient to write out and save to files as we did here.

### Specification

To make sure the agent understand the requirements, we create another document (`specs.md`) using this prompt:
```text
Create a document to be used as specification for the development of this application. Make sure these requirements are included in the specification:
- 25-minute work timer
- 5-minute break timer
- Timer start/stop/reset
- Progress display
- Responsive web UI
Compile the specifications in a file called in specs.md in `docs/` directory.
```


## Let's List What Needs to Be Done
Duration: 10

In using Copilot it is not recommended to try implement a large feature all at once. It is better to start implementing in small increments. This improves the accuracy of the code Copilot suggests and allows for smoother development progress.

Let's consult with Copilot Chat about this. Attach `pomodoro.png`, `architecture.md`, and `specs.md`, using the `Add Context...` button:

![Attach Context](github-copilot-workshop-id/img/__attach.png)

Then enter this prompt:

```
For creating this Pomodoro timer application, please list the necessary functions that need to be implemented.
Then, I want to implement this Pomodoro timer application step by step. Based on the attached image and documents, please suggest what granularity should be used to implement functions and save the step-by-step implementation plan in a file called `plan.md` in the `docs/` directory.
```

![Planning Identification Example](github-copilot-workshop-id/img/__planning.png)

> aside positive
>
> If there are points you'd like to see improved, try pointing them out to Copilot. By this point you should be able to write the prompt you can use to give instructions.

> aside negative
>
> Also, if the result from Copilot does not meet your needs, you can always ask Copilot to make adjustments.


## Let's Implement
Duration: 15



## Explain Code
Duration: 15

Let's have Copilot Chat explain this code.

### Open Copilot Chat

1. Click the **Chat** icon (chat bubble icon) in the VSCode sidebar to open Copilot Chat
2. Or open the Chat panel with `Ctrl+Alt+I` (on macOS `Ctrl+Cmd+I`)

### Check Chat Mode

Confirm the chat mode is set to "Ask".

### Request File Explanation

1. Enter `#server.py` in the chat field. Using the character `#` will let you select a file.
2. Enter the prompt "Please explain this entire file."
3. Press Enter and Copilot Chat will explain the entire `server.py` file

> aside positive
>
> **Tip**: By adding `#` before a filename, you can include that entire file as context.


## Let's List What Needs to Be Done
Duration: 10

Now that the UI mock and architectural design are established, let's consider what specific functionality needs to be implemented. Let's consult with Copilot Chat about this too. At that time, let's attach pomodoro.png and architecture.md.

```
For creating this Pomodoro timer application, please list the necessary functions that need to be implemented.
```

<img src="github-copilot-workshop/img/pomodoro.png" alt="Feature List Consideration" width="400" />

![Feature Identification Example](github-copilot-workshop/img/10-2.list_features.png)

Let's improve this content through chat with Copilot. Once the content is finalized, let's save this content in a file called features.md, just like we did with the architecture.

```
Thank you. That content looks good, so please write the list of functions that need to be implemented in a file called features.md.
```

Now we're about to start implementation, but a tip for mastering Copilot is not to try to implement large functions all at once, but to start implementing small functions first. This improves the accuracy of the code Copilot suggests and allows for smoother development progress.

Let's also consult with Copilot about what granularity to break down and implement this application development. Here, let's attach pomodoro.png, architecture.md, and features.md.

```
I want to implement this Pomodoro timer application step by step. Based on the attached image, architecture, and feature list, please suggest what granularity should be used to implement functions and propose a step-by-step implementation plan.
```

When I tried it, it suggested a plan consisting of 6 steps. If there are points you'd like to see improved, try pointing them out to Copilot. And let's save this content in a file called plan.md so it can be referenced later. Please think for yourself what prompt should be used to give instructions.


## [WIP] Documentation

### Create User Flow

```text
Create a documentation about how to use this web application. Draw a user flow chart and sequence diagram, use Mermaid format.
```
