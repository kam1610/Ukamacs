# -*- coding: japanese-cp932 -*-
## SARS2�̏o�͂���SakuraScript�𐮌`
## \0 or \1���؂�ւ��^�C�~���O�C�܂���\n�o������
## "/"�����ĉ��s�D
## �܂��C������O��ɃN�H�[�e�[�V������t��
$KCODE= "s";
require "jcode";

#scr= ARGV[0]; # �W������
buf= ""; # �o�̓o�b�t�@
state= "norm"; # �W�������E�G�X�P�[�v���� 

open("talk_draft.txt"){|file|
  while line= file.gets;
    scr= line;
    # �󔒍s�̓X�L�b�v
    if(scr !=~ /^\s+$/)
    # �ꕶ�����`�F�b�N
    # (���X�g�̈��O�̕����܂�)
    scr= scr.split("");
    0.upto(scr.length - 2){|i|
      if(scr[i] == "\\")
        # scr[i+1]��n or \d�Ȃ�Ή��s�t���D
        if(scr[i+1] =~ /[\duh]/)
          buf+= " /\n  ";
        elsif(scr[i+1] == "n")
          buf+= "\\n /\n";
          scr[i]= "";
          scr[i+1]= "";
        elsif(scr[i+1] == "e")
          buf+= "\\e \n\n";
          scr[i]= "";
          scr[i+1]= "";
        end
      end
      buf+= scr[i];
    }
    end
  end  
}


print buf;
