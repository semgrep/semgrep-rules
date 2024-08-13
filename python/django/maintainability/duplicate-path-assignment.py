from django.urls import path

# ruleid: duplicate-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view, name="test"),
    path('path/to/view', views.example_view, name="test"),
]

# ruleid: duplicate-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view, name="test"),
    path('path/to/other_view', view.other_view, name="hello"),
    path('path/to/view', views.example_view, name="test"),
]

# ruleid: duplicate-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view),
    path('path/to/view', views.example_view),
]

# ruleid: duplicate-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view, {'abc': 'def'}),
    path('path/to/view', views.example_view, {'abc': 'def'}),
]

# ruleid: duplicate-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view, {'abc': 'def'}),
    path('path/to/view', views.example_view, {'def': 'abc'}),
]

# ruleid: duplicate-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view, {'abc': 'def'}, name="test123"),
    path('path/to/view', views.example_view, {'abc': 'def'}, name="test123"),
]

# ruleid: duplicate-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view, {'abc': 'def'}, name="test123"),
    path('path/to/view', views.example_view, {'def': 'abc'}),
]

# ruleid: duplicate-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view, {'abc': 'def'}, name="test123"),
    path('path/to/view', views.example_view),
]

# ruleid: conflicting-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view, name="test"),
    path('path/to/view', views.other_view, name="test"),
]

# ruleid: conflicting-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view, name="test"),
    path('path/to/other_view', view.other_view, name="hello"),
    path('path/to/view', views.other_view, name="test"),
]

# ruleid: conflicting-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view),
    path('path/to/view', views.other_view),
]

# ruleid: conflicting-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view, {'abc': 'def'}),
    path('path/to/view', views.other_view, {'abc': 'def'}),
]

# ruleid: conflicting-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view, {'abc': 'def'}),
    path('path/to/view', views.other_view, {'def': 'abc'}),
]

# deepok: duplicate-path-assignment
# ruleid: duplicate-path-assignment-different-names, duplicate-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view, name="test"),
    path('path/to/view', views.example_view, name="other_name"),
]

# deepok: duplicate-path-assignment
# ruleid: duplicate-path-assignment-different-names, duplicate-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view, {'abc': 'def'}, name="test"),
    path('path/to/view', views.example_view, {'abc': 'def'}, name="other_name"),
]

# deepok: duplicate-path-assignment
# ruleid: duplicate-path-assignment-different-names, duplicate-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view, {'abc': 'def'}, name="test"),
    path('path/to/other/view', views.other_view, {'abc': 'def'}, name="some_test"),
    path('path/to/view', views.example_view, {'abc': 'def'}, name="other_name"),
]

# deepok: duplicate-path-assignment
# ruleid: duplicate-path-assignment-different-names, duplicate-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view, {'abc': 'def'}, name="test123"),
    path('path/to/view', views.example_view, {'def': 'abc'}, name="test456"),
]

# ruleid: duplicate-name-assignment
urlpatterns = [
    path('path/to/view', views.example_view, name="test123"),
    path('path/to/other/view', views.other_view, name="test123"),
]

# ruleid: conflicting-path-assignment
urlpatterns = [
    path('path/to/view', views.example_view, name="test123"),
    path('path/to/view', views.other_view, name="test123"),
]

# ruleid: duplicate-name-assignment
urlpatterns = [
    path('path/to/view', views.example_view, name="test123"),
    path('path/to/other/view', views.other_view, name="test123"),
]

# ok: duplicate-path-assignment-different-names, conflicting-path-assignment, duplicate-path-assignment
urlpatterns = [
    path('path/to/other_view', views.example_view, name="test"),
    path('path/to/view', views.example_view, name="test"),
]

# ok: duplicate-path-assignment-different-names, conflicting-path-assignment, duplicate-path-assignment
urlpatterns = [
    path('path/to/other_view', views.example_view, name="test"),
    path('path/to/view', views.other_view, name="test_abc"),
]
