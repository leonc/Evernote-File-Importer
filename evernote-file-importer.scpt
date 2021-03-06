FasdUAS 1.101.10   ��   ��    k             l      ��  ��   	m	g
	This AppleScript and work flow are based off the work of Ken Clark, here:
	http://kenclark.me/2009/09/using-mac-os-x-services-to-import-files-into-evernote/
	
	I extended that script just a bit:
		1. It used the last modified date of the file as the creation date of the note.
		2. It can put the note into a specific folder.
		3. It can add tags to the note automatically.
		4. For the title of the note, it drops the extension and converts "-" and "_"
		   to spaces.
		   
	I also borrowed the replaceText funciton from Bruce Phillips available on this thread: http://macscripter.net/viewtopic.php?id=18551
	
	To set this up:
	1. Tweak the script.
		a. set importFolder to the name of the folder you want all your notes to import into.
		   If you want them all in your default folder, you don't need to set a folder name 
		   but you would have to remove the "folder importFolder" from the "create note" line.
		b. set the tags you want on these notes. This version adds a tag called 'file import'.
		   You can add more by adding lines like:
		   	set thisTags to thisTags & "some tag you want"
			set thisTags to thisTags & "some other tag"
	2. Then follow Ken's instructions, replicated here for convenience:
		a. Launch Automator and select "service" from the icons.
		b. Change "service receives selected" to "files and folders". Leave "in" set to "any application" and leave "replaces selected text" unchecked.
		c. In the left column, under Library, click on "Utilities" then click "Run AppleScript" in the column second from the left.
		d. Paste this script into the AppleScript text box.
		e. Go to File..Save As and name the service "File | Import to Evernote"
		f. If you want, set a keyboard shortcut via System Preferences...Keyboard...Keyboard Shortcuts.
		g. In Finder, just right click on a file or several selected files and click in "File | Import to Evernote" to import the contents of the file to Evernote.

	TODO items:
	1. Add the date of the import as a tag. Whenever I tried this, it tanked Evernote, leaking memory and sucking up CPU.
		-- set thisStringDate to ((month of (current date) & " " & day of (current date) & ", " & year of (current date)) as string)		-- set thisStringDate to date string of (current date)		-- display dialog thisStringDate		-- set thisTags to thisTags & thisStringDate		-- display dialog "added to list"	2. Add more (any?) error handling.
	
     � 	 	� 
 	 T h i s   A p p l e S c r i p t   a n d   w o r k   f l o w   a r e   b a s e d   o f f   t h e   w o r k   o f   K e n   C l a r k ,   h e r e : 
 	 h t t p : / / k e n c l a r k . m e / 2 0 0 9 / 0 9 / u s i n g - m a c - o s - x - s e r v i c e s - t o - i m p o r t - f i l e s - i n t o - e v e r n o t e / 
 	 
 	 I   e x t e n d e d   t h a t   s c r i p t   j u s t   a   b i t : 
 	 	 1 .   I t   u s e d   t h e   l a s t   m o d i f i e d   d a t e   o f   t h e   f i l e   a s   t h e   c r e a t i o n   d a t e   o f   t h e   n o t e . 
 	 	 2 .   I t   c a n   p u t   t h e   n o t e   i n t o   a   s p e c i f i c   f o l d e r . 
 	 	 3 .   I t   c a n   a d d   t a g s   t o   t h e   n o t e   a u t o m a t i c a l l y . 
 	 	 4 .   F o r   t h e   t i t l e   o f   t h e   n o t e ,   i t   d r o p s   t h e   e x t e n s i o n   a n d   c o n v e r t s   " - "   a n d   " _ " 
 	 	       t o   s p a c e s . 
 	 	       
 	 I   a l s o   b o r r o w e d   t h e   r e p l a c e T e x t   f u n c i t o n   f r o m   B r u c e   P h i l l i p s   a v a i l a b l e   o n   t h i s   t h r e a d :   h t t p : / / m a c s c r i p t e r . n e t / v i e w t o p i c . p h p ? i d = 1 8 5 5 1 
 	 
 	 T o   s e t   t h i s   u p : 
 	 1 .   T w e a k   t h e   s c r i p t . 
 	 	 a .   s e t   i m p o r t F o l d e r   t o   t h e   n a m e   o f   t h e   f o l d e r   y o u   w a n t   a l l   y o u r   n o t e s   t o   i m p o r t   i n t o . 
 	 	       I f   y o u   w a n t   t h e m   a l l   i n   y o u r   d e f a u l t   f o l d e r ,   y o u   d o n ' t   n e e d   t o   s e t   a   f o l d e r   n a m e   
 	 	       b u t   y o u   w o u l d   h a v e   t o   r e m o v e   t h e   " f o l d e r   i m p o r t F o l d e r "   f r o m   t h e   " c r e a t e   n o t e "   l i n e . 
 	 	 b .   s e t   t h e   t a g s   y o u   w a n t   o n   t h e s e   n o t e s .   T h i s   v e r s i o n   a d d s   a   t a g   c a l l e d   ' f i l e   i m p o r t ' . 
 	 	       Y o u   c a n   a d d   m o r e   b y   a d d i n g   l i n e s   l i k e : 
 	 	       	 s e t   t h i s T a g s   t o   t h i s T a g s   &   " s o m e   t a g   y o u   w a n t " 
 	 	 	 s e t   t h i s T a g s   t o   t h i s T a g s   &   " s o m e   o t h e r   t a g " 
 	 2 .   T h e n   f o l l o w   K e n ' s   i n s t r u c t i o n s ,   r e p l i c a t e d   h e r e   f o r   c o n v e n i e n c e : 
 	 	 a .   L a u n c h   A u t o m a t o r   a n d   s e l e c t   " s e r v i c e "   f r o m   t h e   i c o n s . 
 	 	 b .   C h a n g e   " s e r v i c e   r e c e i v e s   s e l e c t e d "   t o   " f i l e s   a n d   f o l d e r s " .   L e a v e   " i n "   s e t   t o   " a n y   a p p l i c a t i o n "   a n d   l e a v e   " r e p l a c e s   s e l e c t e d   t e x t "   u n c h e c k e d . 
 	 	 c .   I n   t h e   l e f t   c o l u m n ,   u n d e r   L i b r a r y ,   c l i c k   o n   " U t i l i t i e s "   t h e n   c l i c k   " R u n   A p p l e S c r i p t "   i n   t h e   c o l u m n   s e c o n d   f r o m   t h e   l e f t . 
 	 	 d .   P a s t e   t h i s   s c r i p t   i n t o   t h e   A p p l e S c r i p t   t e x t   b o x . 
 	 	 e .   G o   t o   F i l e . . S a v e   A s   a n d   n a m e   t h e   s e r v i c e   " F i l e   |   I m p o r t   t o   E v e r n o t e " 
 	 	 f .   I f   y o u   w a n t ,   s e t   a   k e y b o a r d   s h o r t c u t   v i a   S y s t e m   P r e f e r e n c e s . . . K e y b o a r d . . . K e y b o a r d   S h o r t c u t s . 
 	 	 g .   I n   F i n d e r ,   j u s t   r i g h t   c l i c k   o n   a   f i l e   o r   s e v e r a l   s e l e c t e d   f i l e s   a n d   c l i c k   i n   " F i l e   |   I m p o r t   t o   E v e r n o t e "   t o   i m p o r t   t h e   c o n t e n t s   o f   t h e   f i l e   t o   E v e r n o t e . 
 
 	 T O D O   i t e m s : 
 	 1 .   A d d   t h e   d a t e   o f   t h e   i m p o r t   a s   a   t a g .   W h e n e v e r   I   t r i e d   t h i s ,   i t   t a n k e d   E v e r n o t e ,   l e a k i n g   m e m o r y   a n d   s u c k i n g   u p   C P U . 
 	 	 - -   s e t   t h i s S t r i n g D a t e   t o   ( ( m o n t h   o f   ( c u r r e n t   d a t e )   &   "   "   &   d a y   o f   ( c u r r e n t   d a t e )   &   " ,   "   &   y e a r   o f   ( c u r r e n t   d a t e ) )   a s   s t r i n g )  	 	 - -   s e t   t h i s S t r i n g D a t e   t o   d a t e   s t r i n g   o f   ( c u r r e n t   d a t e )  	 	 - -   d i s p l a y   d i a l o g   t h i s S t r i n g D a t e  	 	 - -   s e t   t h i s T a g s   t o   t h i s T a g s   &   t h i s S t r i n g D a t e  	 	 - -   d i s p l a y   d i a l o g   " a d d e d   t o   l i s t "  	 2 .   A d d   m o r e   ( a n y ? )   e r r o r   h a n d l i n g . 
 	 
   
  
 l     ��������  ��  ��        i         I     �� ��
�� .aevtoappnull  �   � ****  J          ��  o      ���� 	0 input  ��  ��    k     �       r         m        �    _ t e s t _ i m p o r t s  o      ���� 0 importfolder importFolder   ��  X    � ��   k    �       l   ��   !��       set up tags for the file    ! � " " 2   s e t   u p   t a g s   f o r   t h e   f i l e   # $ # r     % & % J    ����   & o      ���� 0 thistags thisTags $  ' ( ' r     ) * ) b     + , + o    ���� 0 thistags thisTags , m     - - � . .  f i l e   i m p o r t * o      ���� 0 thistags thisTags (  / 0 / l   ��������  ��  ��   0  1 2 1 l   � 3 4 5 3 O    � 6 7 6 k   # � 8 8  9 : 9 l  # #��������  ��  ��   :  ; < ; l  # #�� = >��   = F @ set the title of the note to be the file name without extension    > � ? ? �   s e t   t h e   t i t l e   o f   t h e   n o t e   t o   b e   t h e   f i l e   n a m e   w i t h o u t   e x t e n s i o n <  @ A @ r   # ( B C B n  # & D E D 1   $ &��
�� 
txdl E 1   # $��
�� 
ascr C o      ���� 0 default_delimiters   A  F G F r   ) . H I H n   ) , J K J 1   * ,��
�� 
pnam K o   ) *���� 0 thisfile thisFile I o      ���� 0 thisfilename thisFileName G  L M L l  / ] N O P N Z   / ] Q R���� Q E   / 2 S T S o   / 0���� 0 thisfilename thisFileName T m   0 1 U U � V V  . R k   5 Y W W  X Y X r   5 : Z [ Z m   5 6 \ \ � ] ]  . [ n      ^ _ ^ 1   7 9��
�� 
txdl _ 1   6 7��
�� 
ascr Y  ` a ` r   ; C b c b l  ; ? d���� d n   ; ? e f e 4  < ?�� g
�� 
citm g m   = >������ f o   ; <���� 0 thisfilename thisFileName��  ��   c o      ���� &0 thisfileextension thisFileExtension a  h�� h r   D Y i j i c   D U k l k l  D Q m���� m n   D Q n o n 7 E Q�� p q
�� 
citm p m   I K����  q m   L P������ o o   D E���� 0 thisfilename thisFileName��  ��   l m   Q T��
�� 
TEXT j o      ���� $0 thisfilebasename thisFileBaseName��  ��  ��   O * $ the if the file name has a . in it     P � r r H   t h e   i f   t h e   f i l e   n a m e   h a s   a   .   i n   i t   M  s t s r   ^ c u v u o   ^ _���� 0 default_delimiters   v n      w x w 1   ` b��
�� 
txdl x 1   _ `��
�� 
ascr t  y z y r   d k { | { o   d g���� $0 thisfilebasename thisFileBaseName | o      ���� 0 thisnotetitle thisNoteTitle z  } ~ } l  l l��  ���    / ) change the - and _ in the name to spaces    � � � � R   c h a n g e   t h e   -   a n d   _   i n   t h e   n a m e   t o   s p a c e s ~  � � � r   l ~ � � � n  l z � � � I   m z�� ����� 0 replacetext replaceText �  � � � m   m p � � � � �  - �  � � � m   p s � � � � �    �  ��� � o   s v���� 0 thisnotetitle thisNoteTitle��  ��   �  f   l m � o      ���� 0 thisnotetitle thisNoteTitle �  � � � r    � � � � n   � � � � I   � ��� ����� 0 replacetext replaceText �  � � � m   � � � � � � �  _ �  � � � m   � � � � � � �    �  ��� � o   � ����� 0 thisnotetitle thisNoteTitle��  ��   �  f    � � o      ���� 0 thisnotetitle thisNoteTitle �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � $  get the mod date of the file     � � � � <   g e t   t h e   m o d   d a t e   o f   t h e   f i l e   �  � � � r   � � � � � l  � � ����� � n   � � � � � 1   � ���
�� 
asmo � o   � ����� 0 thisfile thisFile��  ��   � o      ���� 0 thisfiledate thisFileDate �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � ; 5 make the original name of the file a tag on the note    � � � � j   m a k e   t h e   o r i g i n a l   n a m e   o f   t h e   f i l e   a   t a g   o n   t h e   n o t e �  ��� � r   � � � � � b   � � � � � o   � ����� 0 thistags thisTags � n   � � � � � 1   � ���
�� 
pnam � o   � ����� 0 thisfile thisFile � o      ���� 0 thistags thisTags��   7 m      � ��                                                                                  MACS  alis    n  danube disk                �� H+  �
Finder.app                                                     �`Ƙ�        ����  	                CoreServices    ��Tq      ƘK�    ���  2danube disk:System:Library:CoreServices:Finder.app   
 F i n d e r . a p p    d a n u b e   d i s k  &System/Library/CoreServices/Finder.app  / ��   4    stop dealing with Finder     5 � � � 4   s t o p   d e a l i n g   w i t h   F i n d e r   2  � � � l  � ���������  ��  ��   �  ��� � l  � � � � � � O   � � � � � l  � � � � � � Q   � � � � � � I  � ����� �
�� .EVRNcrntnull��� ��� null��   � �� � �
�� 
kfil � o   � ����� 0 thisfile thisFile � �� � �
�� 
Entt � o   � ����� 0 thisnotetitle thisNoteTitle � �� � �
�� 
Endt � o   � ����� 0 thisfiledate thisFileDate � �� � �
�� 
Ennb � o   � ����� 0 importfolder importFolder � �� ���
�� 
Engg � o   � ����� 0 thistags thisTags��   � R      �� � �
�� .ascrerr ****      � **** � o      ���� 0 error_message   � �� ���
�� 
errn � o      ���� 0 error_number  ��   � I  � ��� � �
�� .sysodisAaleR        TEXT � m   � � � � � � � . S e n d   t o   E v e r n o t e   F a i l e d � �� � �
�� 
mesS � b   � � � � � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � & E r r o r :                           � o   � ����� 0 error_message   � m   � � � � � � �   � m   � � � � � � �  E r r o r   N u m b e r :     � o   � ����� 0 error_number   � �� ���
�� 
as A � m   � ���
�� EAlTwarN��   �   to create note    � � � �    t o   c r e a t e   n o t e � m   � � � ��                                                                                  EVRN  alis    R  danube disk                �� H+  Evernote.app                                                   �f����        ����  	                Applications    ��Tq      � 
      %danube disk:Applications:Evernote.app     E v e r n o t e . a p p    d a n u b e   d i s k  Applications/Evernote.app   / ��   �  	 evernote    � � � �    e v e r n o t e��  �� 0 thisfile thisFile  o    ���� 	0 input  ��     � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 0 replacetext replaceText �  � � � o      ���� 0 find   �  � � � o      ���� 0 replace   �  ��  o      ���� 0 subject  ��  ��   � k     &  r      n     1    ��
�� 
txdl 1     ��
�� 
ascr o      �� 0 prevtids prevTIDs 	 r    

 o    �~�~ 0 find   n      1    
�}
�} 
txdl 1    �|
�| 
ascr	  r     n     2   �{
�{ 
citm o    �z�z 0 subject   o      �y�y 0 subject    l   �x�w�v�x  �w  �v    r     o    �u�u 0 replace   n      1    �t
�t 
txdl 1    �s
�s 
ascr  r     b     !  m    "" �##  ! o    �r�r 0 subject   o      �q�q 0 subject   $%$ r    #&'& o    �p�p 0 prevtids prevTIDs' n     ()( 1     "�o
�o 
txdl) 1     �n
�n 
ascr% *+* l  $ $�m�l�k�m  �l  �k  + ,�j, L   $ &-- o   $ %�i�i 0 subject  �j   � .�h. l     �g�f�e�g  �f  �e  �h       �d/01�d  / �c�b
�c .aevtoappnull  �   � ****�b 0 replacetext replaceText0 �a �`�_23�^
�a .aevtoappnull  �   � ****�` �]4�] 4  �\�\ 	0 input  �_  2 �[�Z�Y�X�[ 	0 input  �Z 0 thisfile thisFile�Y 0 error_message  �X 0 error_number  3 / �W�V�U�T�S - ��R�Q�P�O�N U \�M�L�K�J�I�H � ��G � ��F�E ��D�C�B�A�@�?�>�=5 ��< � � ��;�:�9�8�W 0 importfolder importFolder
�V 
kocl
�U 
cobj
�T .corecnte****       ****�S 0 thistags thisTags
�R 
ascr
�Q 
txdl�P 0 default_delimiters  
�O 
pnam�N 0 thisfilename thisFileName
�M 
citm�L &0 thisfileextension thisFileExtension�K��
�J 
TEXT�I $0 thisfilebasename thisFileBaseName�H 0 thisnotetitle thisNoteTitle�G 0 replacetext replaceText
�F 
asmo�E 0 thisfiledate thisFileDate
�D 
kfil
�C 
Entt
�B 
Endt
�A 
Ennb
�@ 
Engg�? 

�> .EVRNcrntnull��� ��� null�= 0 error_message  5 �7�6�5
�7 
errn�6 0 error_number  �5  
�< 
mesS
�; 
as A
�: EAlTwarN�9 
�8 .sysodisAaleR        TEXT�^ ��E�O ��[��l kh jvE�O��%E�O� ���,E�O��,E�O�� )���,FO��i/E` O�[�\[Zk\Za 2a &E` Y hO���,FO_ E` O)a a _ m+ E` O)a a _ m+ E` O�a ,E` Oš�,%E�UOa  M $*a �a _ a _ a  �a !�a " #W (X $ %a &a 'a (�%a )%a *%�%a +a ,a - .U[OY�1 �4 ��3�267�1�4 0 replacetext replaceText�3 �08�0 8  �/�.�-�/ 0 find  �. 0 replace  �- 0 subject  �2  6 �,�+�*�)�, 0 find  �+ 0 replace  �* 0 subject  �) 0 prevtids prevTIDs7 �(�'�&"
�( 
ascr
�' 
txdl
�& 
citm�1 '��,E�O���,FO��-E�O���,FO�%E�O���,FO� ascr  ��ޭ