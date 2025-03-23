# StackSmash

# **Shellcode & Buffer Overflow Exploit**  

## **Overview**  
This project focuses on **developing shellcode**, **reverse engineering assembly code**, and **exploiting a buffer overflow vulnerability** to gain control over a remote system. The main objectives were:  

- Writing **SM213 shellcode** to execute `/bin/sh` using the **sys $2 (exec)** system call.  
- Reverse-engineering vulnerable assembly code into **C** to analyze security flaws.  
- Exploiting a **stack smash attack** to hijack the return address and execute arbitrary code.  
- Successfully gaining a **remote shell** on a vulnerable Linux server and capturing a security flag.  

---

## **Project Structure**  

📂 **Shellcode-Exploit**  
├── 📜 `README.md` – Project documentation  
├── 📜 `shellcode.s` – Assembly code for executing /bin/sh  
├── 📜 `shellcode.hex` – Hexadecimal machine code for shellcode  
├── 📜 `vuln.s` – Vulnerable assembly program  
├── 📜 `vuln.c` – Reverse-engineered C code from vuln.s  
├── 📜 `proof.hex` – Exploit string to call the proof function  
├── 📜 `exploit.hex` – Final exploit string embedding shellcode  
└── 📂 `docs/` – Additional documentation  

---

## **Technical Details**  

### **1. Writing Shellcode**  
The shellcode was written in **SM213 assembly** and executed using the **sys $2 (exec)** system call. The challenge was to ensure **position-independent code**, meaning no absolute addresses were used. The **gpc instruction** helped with this.  

### **2. Reverse Engineering (Assembly to C)**  
- The vulnerable **vuln.s** program was disassembled and converted into a **C equivalent (vuln.c)**.  
- System calls like `sys $0 (read)` were mapped to their respective C functions.  
- The vulnerability was left **intact** to accurately reflect the original security flaw.  

### **3. Buffer Overflow & Stack Smash Attack**  
- Identified a function (`proof()`) that prints a **secret message**.  
- Crafted an attack string (`proof.hex`) to **overwrite the return address**, forcing the program to call `proof()`.  
- Combined **shellcode + return address overwrite** to execute arbitrary code (`exploit.hex`).  

### **4. Remote Exploitation & Capturing the Flag**  
- Connected to a **real Linux server** running the vulnerable program.  
- Injected the final payload (`exploit.hex`) and gained a **remote shell**.  
- Executed the `./getflag` program to retrieve the **secret flag**.  

---

## **How to Run the Exploit**  

### **1. Testing Locally with the Simulator**  
You can test the shellcode using the simulator by converting the hexadecimal machine code (`shellcode.hex`) to binary and running it with the following command:
xxd -r -p shellcode.hex | java -jar SimpleMachine213.jar -i cli test.s
If successful, you should see the following output:
<<<WOULD EXECUTE /bin/sh>>>

### **2. Buffer Overflow Attack**  
To exploit the buffer overflow and test the attack string (`proof.hex`), run the following command:
xxd -r -p proof.hex | java -jar SimpleMachine213.jar -i cli vuln.s
Expected output:

### **3. Full Exploit to Get a Shell**  
To execute the final exploit with embedded shellcode and return address overwrite (`exploit.hex`), run:
xxd -r -p exploit.hex | java -jar SimpleMachine213.jar -i cli vuln.s
If successful, you should see:
<<<WOULD EXECUTE /bin/sh>>>

### **4. Remote Exploitation (Bonus Challenge)**  
To send your exploit to the remote server and gain access, use:
xxd -r -p exploit.hex | nc <server-ip> <port>
Once inside the remote shell, run:
./getflag

---

## **Key Takeaways & Skills Learned**  
✅ **Assembly Programming** – Writing low-level shellcode in SM213.  
✅ **Reverse Engineering** – Converting Assembly to C for vulnerability analysis.  
✅ **Binary Exploitation** – Manipulating memory & executing arbitrary code.  
✅ **Buffer Overflow Attacks** – Overwriting return addresses to hijack execution.  
✅ **Security Testing** – Exploiting a real-world system to obtain a shell.  

---

## **Disclaimer**  
🚨 **This project is for educational purposes only.** 🚨  
Unauthorized access to systems **without permission** is illegal. The goal of this project is to understand security vulnerabilities and improve defensive programming techniques.  

