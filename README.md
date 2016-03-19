# mumps-data-type-library
A new data-type library for the Mumps Advanced Shell (MASH).

The Mumps Advanced Shell (MASH) is a project to create a standard toolset and integrated development environment for Mumps systems. Although MASH has been under development for years, the first versions are being released only recently, with most of its modules still unreleased. So far, MASH as released includes Dr. Joel Ivey and Dr. Sam Habiel's M-Unit unit-testing framework for Mumps (in the %ut namespace), version 1.3 of which has been released and certified at OSEHRA Certification Level 4, and version 1.4 of which was just released in February.

The mumps-data-type-library project is extending MASH to include its next module, to be publicly released as part of MASH version 1.5 in the future, when the initial suite of functions and procedures is complete and fully unit tested. For now, it is under active development and still volatile, so caveat emptor and all that. The version numbers of the second lines of these routines is shown as 1.5-development, with no release date yet. 

Our current focus is on (1) creating a complete unit-test suite for the existing string-library subroutines, (2) breaking routine %ts into manageable routines, (3) finishing the initial suite of subroutines, which includes a subset of those sketched out in routine %ts's to-do list, and (4) creating a new math library in %tn. Our top priority, though, was to shift development here to Github, instead of mostly being on my laptop and a few development and testing servers, which has now been done - Yay!
