//
//  main.m
//  escreveArquivo
//
//  Created by ALS on 04/05/14.
//  Copyright (c) 2014 Cotrim. All rights reserved.
//

#import <Cocoa/Cocoa.h>

int main(int argc, char *argv[])
{
    
    NSMutableString *str = [[NSMutableString alloc] init];
    
    NSError *erro;
    
    for(int i =0; i< 10; i++){
        [str appendString:@"Eu sou o muito doido\n"];
    }
    
    [str writeToFile:@"/tmp/cool.txt"
          atomically:YES
            encoding:NSUTF8StringEncoding
               error:&erro];
    
    NSLog(@"Escrevendo no arquivo!\n");
    if(erro)
        NSLog(@"%@",[erro description]);
    
    NSLog(@"Recuperando do arquivo!");
    
    NSError *erroLeitura;
    
    NSString *strA = [[NSString alloc]
                      initWithContentsOfFile:@"/tmp/cool.txt"
                                    encoding:NSASCIIStringEncoding
                                        error:&erroLeitura];
    if(!strA){
        NSLog(@"falhou: %@",[erroLeitura localizedDescription]);
    }else {
        NSLog(@"Pegou os dados %@",strA);
    }
    
    
    return NSApplicationMain(argc, (const char **)argv);
}
