package org.dsoc.joinews.client.controller;

import org.dsoc.joinews.client.controller.vo.ClientSummary;
import org.dsoc.joinews.client.repository.ClientRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class ClientControllerTest {

    @Mock
    public ClientRepository clientRepository;

    public ClientController clientController;

    @Test
    public void summaryTest() {
        when(clientRepository.count()).thenReturn(30L);

        clientController = new ClientController(clientRepository);

        ClientSummary result = clientController.getClientSummary();

        assertThat(result.getCount()).isEqualTo(30L);
    }
}
