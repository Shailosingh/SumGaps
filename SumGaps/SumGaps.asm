; Takes in a DWORD array in nondecreasing order called, "myArray" and sums the gaps between the numbers

.386									; Sets program as using the 32-bit x86 instructions
.model flat, stdcall					; Sets the memory model as flat and uses the standard call for procedures
.stack 4096								; Gives the program stack 4096 bytes
ExitProcess PROTO, dwExitCode:DWORD		; Declares prototype for ExitProcess

.data
myArray DWORD 0,2,5,9,10				; Input array whose gaps will be summed
myArrayLength = ($ - myArray) / 4

.code
MAIN PROC
	mov ecx, myArrayLength				; Sets ecx as the counter for how many numbers in myArray will be iterated through, esi as the index and eax as the sum of the gaps
	dec ecx
	mov esi, OFFSET myArray
	mov eax, 0

	SumGaps:
		mov ebx, [esi + TYPE myArray]	; Calcualate gap between current index and the next
		sub ebx, [esi]

		add eax, ebx					; Sum the current gap to the total gap

		add esi, TYPE myArray			; Increment index and loop if there are more gaps to compute
		loop SumGaps

	INVOKE ExitProcess, 0				; Returns 0 to the OS as the exit code
main ENDP
END MAIN