function h = generateFilter( Ft1, Ft2, N, Fs,filterType)
    switch filterType
        case 'FTJ'
            h = generateFTJ(Ft1, N, Fs);
        case 'FTS'
            h = generateFTS(Ft1, N, Fs);        
        case 'FTB'
            h = generateFTB(Ft1, Ft2, N, Fs);
        otherwise
            h = generateFOB(Ft1, Ft2, N, Fs);
    end
end
