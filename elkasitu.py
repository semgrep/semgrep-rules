from django.db import migrations, models

# Wrong, NOT NULL with python-based default
class Migration(migrations.Migration):
    operations = [
        # ruleid: django-migration-slow-default
        migrations.AddField(
            model_name='foo',
            name='bar',
            field=models.JSONField(blank=True),
            foo="bar",
        ),
    ]

# Correct, NOT NULL with SQL default
class Migration(migrations.Migration):
    operations = [
        migrations.RunSQL(
            """
            ALTER TABLE "foo"
            ADD COLUMN "bar" JSONB
            NOT NULL
            DEFAULT '{}'::JSONB
            """,
            reverse_sql="""
            ALTER TABLE "foo"
            DROP COLUMN "bar"
            """,
            state_operations=[
                # ok: django-migration-slow-default
                migrations.AddField(
                    model_name='foo',
                    name='bar',
                    field=models.JSONField(blank=True, default=dict),
                    foo="bar",
                ),
            ],
        ),
    ]

# Correct, NULL allowed
class Migration(migrations.Migration):
    operations = [
        # ok: django-migration-slow-default
        migrations.AddField(
            model_name='foo',
            name='bar',
            field=models.JSONField(blank=True, null=True),
        ),
    ]


# Correct, table is being created thus no data to backfill
class Migration(migrations.Migration):
    operations = [
        migrations.CreateModel(
            name="Foo",
            fields=[],
        ),
        # todook: django-migration-slow-default
        migrations.AddField(
            model_name='foo',
            name='bar',
            field=models.ForeignKey(blank=True),
            foo="bar",
        ),
    ]
