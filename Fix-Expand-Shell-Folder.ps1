<#
.Synopsis
   Quick fix for expand shell folder contant error
.DESCRIPTION
   Prereq for succesfull installation when the following error occurs:
   Internal error: Failed to expand shell folder constant "userdocs"
   Created: "C:\Windows\SysWOW64\config\systemprofile\Documents" manually to bypass the installation error.
.EXAMPLE
   Could also be used for the error "userdocuments", just replace below
.NOTES
   Filename: Fix-Expand-Shell-Folder.ps1
   Author: Jeroen Ebus (https://manage-the.cloud) 
   Modified date: 2023-05-09
   Version 1.0 - Release notes/details
#>

New-Item -Path "C:\Windows\SysWOW64\config\systemprofile\Desktop"
