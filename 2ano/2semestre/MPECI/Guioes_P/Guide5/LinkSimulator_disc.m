function AM = LinkSimulator_disc(lambda, C, F, N, sizes, cdf)
%
% AM = LinkSimulator_disc(lambda, C, F, N, sizes, cdf)
%
% Versão modificada do LinkSimulator com tamanho de pacote DISCRETO.
%
% Input:
%     lambda: taxa de chegada de pacotes (pps)
%     C:      capacidade da ligação (Mbps)
%     F:      capacidade da fila (em pacotes)
%     N:      critério de paragem (n.º de pacotes transmitidos)
%     sizes:  vector com os tamanhos possíveis dos pacotes (Bytes)
%     cdf:    vector com a função distribuição cumulativa (já pré-calculada
%             a partir das probabilidades), com cdf(end) = 1
% Output:
%     AM:     atraso médio por pacote (segundos)

    ARRIVAL   = 0;
    DEPARTURE = 1;
    Clock       = 0;
    STATE       = 0;
    QUEUE_N     = 0;
    DELAYS      = 0;
    TRANSMITTED = 0;
    QUEUE       = [];

    tmp = Clock + exprnd(1/lambda);
    EventList = [ARRIVAL, tmp, tmp];

    while TRANSMITTED < N
        EventList   = sortrows(EventList, 2);
        Event       = EventList(1,1);
        Clock       = EventList(1,2);
        ArrInstant  = EventList(1,3);
        EventList(1,:) = [];

        switch Event
            case ARRIVAL
                tmp = Clock + exprnd(1/lambda);
                EventList = [EventList; ARRIVAL, tmp, tmp];
                if STATE == 0
                    STATE = 1;
                    % --- DIFERENÇA EM RELAÇÃO AO ORIGINAL ---
                    % Em vez de exprnd(B), amostramos um tamanho da distribuição
                    % discreta usando a CDF (inverse transform sampling)
                    pkt_size = sizes( find(rand <= cdf, 1) );
                    tTime = 8 * pkt_size / (C*1e6);             % em segundos
                    EventList = [EventList; DEPARTURE, Clock + tTime, ArrInstant];
                else
                    if QUEUE_N < F
                        QUEUE_N = QUEUE_N + 1;
                        QUEUE   = [QUEUE; ArrInstant];
                    end
                end
            case DEPARTURE
                DELAYS      = DELAYS + (Clock - ArrInstant);
                TRANSMITTED = TRANSMITTED + 1;
                if QUEUE_N > 0
                    QInstant = QUEUE(1);
                    pkt_size = sizes( find(rand <= cdf, 1) );
                    tTime = 8 * pkt_size / (C*1e6);
                    EventList = [EventList; DEPARTURE, Clock + tTime, QInstant];
                    QUEUE_N   = QUEUE_N - 1;
                    QUEUE(1)  = [];
                else
                    STATE = 0;
                end
        end
    end
    AM = DELAYS / TRANSMITTED;
end
