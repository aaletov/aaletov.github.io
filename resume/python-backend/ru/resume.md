# О себе
Люблю находить новые решения к привычным задачам

## Контакты
Github: https://github.com/aaletov
Gitlab: https://gitlab.com/aapozd
LinkedIn: https://www.linkedin.com/in/artemy-pozdnyakov-b7972b233/
Telegram: https://t.me/aaletov

# Образование
## Санкт-Петербургский политехнический университет им. Петра Великого
Программная инженерия, Бакалавр, 2020-2024
### Курсы
- Технологии программирования (C++)
- Объектно-ориентированное программирование (Java)
- Алгоритмы и структуры данных (С++)
- Операционные системы (C)
- Системное программное обеспечение GNU/Linux
- Архитектура ЭВМ (ASM)
- Базы данных (SQL)

# Опыт
## Лаборатория Dell Technologies - ВШПИ СПбПУ
Стажёр (Go), Санкт-Петербург, Февраль 2022 - Август 2022
Участвовал в разработке CSI-драйвера для Kubernetes компании Dell - csi-baremetal
- Разработал тестовую реализацию gRPC-сервиса на Go для поддержки Storage Capacity в драйвере, реализация была протестирована в окружении Kind
- Разработал proposal с планом реализации поддержки Storage Capacity в проекте для снижения нагрузки на использовавшийся кастомный планировщик

## Linxdatacenter
Младший разработчик бэкенда (Go), Санкт-Петербург, Сентябрь 2022 - Июнь 2023
Участвовал в разработке бэкенда клиентского портала компании Linxdatacenter
- Переработал модуль аутентификации пользователей, что позволило в несколько раз сократить объем кода обработки JWT-токенов, ответственного за ограничение доступа к методам API
- Разработал микросервис для доступа к истории посещения ЦОД
- Реализовал с нуля BDD-тесты для основного микросервиса, в процессе были исправлены и приведены в соответствие между собой OpenAPI-спецификации различных микросервисов, что позволило согласовать логику данных сервисов и фронтенда


# Проекты
## Классификатор болезней растений
Февраль 2024 - Апрель 2024
Классификатор болезней томатов на основе свёрточной нейронной сети
https://drive.google.com/file/d/1KlmD0ReghzGh0-9VH6kiTnjh76DOb4j9/view
- Построил нейронную сеть с помощью Tensorflow Keras, используется комбинация свёрточной нейронной сети и многослойного перцептрона с признаками Харалика в качестве входа
- Точность модели (0.84) при совместном использовании подходов на основе CNN и обычной классификации в линейно неразделимой выборке с помощью MLP, оказалась выше, чем при использовании данных моделей по отдельности

## Система рассылки на платформе ВКонтакте
Сентябрь 2023 - Апрель 2024
Командный проект - чат-бот на Python для рассылок с системой авторизации на основе приглашений
https://github.com/users/aaletov/projects/2
- Разработал MVP по спецификации в рамках одного сервиса
- Спроектировал gRPC API, реализующий бизнес-логику приложения и составил план разделения MVP на микросервисы. Данное решение позволило сохранить поведение приложения после переработки кода, а также отделить логику обработки событий платформы (ВК) от логики самого приложения
- Разработал систему приглашений на основе JWT и системы авторизации ВКонтакте, публичная часть реализована на FastAPI
- Участвовал в планировании и разработке модульных, интеграционных и системных тестов, в том числе тестирование интеграции с Google Sheets

## План реализации Storage Capacity в драйвере csi-baremetal
Март 2022 - Август 2022

https://github.com/dell/csi-baremetal/blob/8085a0a2b61703f6646f68684c31e6cc1c8f815f/docs/proposals/storage-capacity-proposal.md

## Моделирование СМО
Сентябрь 2022 - Ноябрь 2022
Модель СМО в виде клиент-серверного приложения (Golang, React, REST)
https://github.com/aaletov/go-smo

## Система автоматизации работы больницы
Февраль 2022 - Май 2022
Разработал веб-приложение на языке Java, позволяющее автоматировать работу больницы. Бэкенд написан с использованием паттерна MVC и фреймворка Spring, фронтенд использует фреймворк Vaadin
https://github.com/aaletov/spring-cs


# Навыки
- Back-end development:  Microservices,  REST,  OpenAPI,  gRPC,  JWT,  OAuth,  Git, 
- Frameworks + Tools:  FastAPI,  Flask,  Poetry,  Asyncio,  Pytest, 
- Database Management:  SQL,  PostgreSQL,  Redis, 
- Testing:  TDD,  BDD,  Unit testing, 
- Teamwork:  Agile,  Scrum,  Confluence,  Jira, 
- Programming languages:  Python,  Go,  C++,  Bash,  LaTeX, 