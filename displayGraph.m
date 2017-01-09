function displayGraph(x, y, durata, titleText, limitA, maxA) 

    plot(x, y, 'g');
    if limitA == 1
        axis([0, 1/20*durata, -(maxA+1), (maxA+1)]);
    end            

    xlabel('frecventa [Hz]')
    ylabel('amplitudine');
    title(titleText);
    
end
